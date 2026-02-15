import 'dart:developer'; // Better for logging than debugPrint
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _googleInitialized = false;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  /// **Sign Up with Email & Password**
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signUp: ${e.code}");

      // Handle specific Firebase errors
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جداً');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'invalid-email') {
        throw CustomException('عنوان البريد الإلكتروني غير صالح');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException('عملية التسجيل غير مفعلة حالياً');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تأكد من اتصالك بالإنترنت');
      } else {
        // Fallback for other Firebase errors
        throw CustomException('حدث خطأ أثناء التسجيل، يرجى المحاولة لاحقاً');
      }
    } catch (e) {
      log("Generic Exception in FirebaseAuthService.signUp: $e");
      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
    }
  }

  /// **Sign In with Email & Password**
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signIn: ${e.code}");

      if (e.code == 'user-not-found') {
        throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.code == 'wrong-password') {
        throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.code == 'invalid-credential') {
        // Important: This is the new error code for invalid login in newer Firebase versions
        throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.code == 'user-disabled') {
        throw CustomException('تم تعطيل هذا الحساب، يرجى التواصل مع الدعم');
      } else if (e.code == 'invalid-email') {
        throw CustomException('عنوان البريد الإلكتروني غير صالح');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
          'تم تجاوز الحد المسموح من المحاولات، حاول لاحقاً',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تأكد من اتصالك بالإنترنت');
      } else {
        throw CustomException(
          'حدث خطأ أثناء تسجيل الدخول، يرجى المحاولة لاحقاً',
        );
      }
    } catch (e) {
      log("Generic Exception in FirebaseAuthService.signIn: $e");
      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
    }
  }

  /// **Sign Out**
  Future<void> signOut() async {
    await _googleSignIn.signOut();

    await _auth.signOut();
  }

  /// **Password Reset**
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException('لم يتم العثور على حساب بهذا البريد الإلكتروني');
      } else if (e.code == 'invalid-email') {
        throw CustomException('عنوان البريد الإلكتروني غير صالح');
      } else {
        throw CustomException('حدث خطأ، يرجى المحاولة لاحقاً');
      }
    }
  }

  /// **Delete Account**
  Future<void> deleteAccount() async {
    await _auth.currentUser!.delete();
  }

  /// **Sign In with Google**
  Future<User> signInWithGoogle() async {
    try {
      // Initialize only once
      if (!_googleInitialized) {
        await _googleSignIn.initialize();
        _googleInitialized = true;
      }

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential.user!;
    } on GoogleSignInException catch (e) {
      log("GoogleSignInException: ${e.code}");

      switch (e.code) {
        case GoogleSignInExceptionCode.canceled:
          throw CustomException('تم إلغاء تسجيل الدخول');

        case GoogleSignInExceptionCode.interrupted:
          throw CustomException('تم مقاطعة تسجيل الدخول');

        case GoogleSignInExceptionCode.clientConfigurationError:
          throw CustomException('خطأ في إعداد Google Sign-In');

        default:
          throw CustomException('تأكد من اتصالك بالإنترنت أو حاول لاحقاً');
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code}");

      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException('يوجد حساب بنفس البريد ولكن بطريقة تسجيل مختلفة');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('بيانات تسجيل الدخول غير صالحة');
      } else {
        throw CustomException('فشل تسجيل الدخول بواسطة Google');
      }
    } catch (e) {
      log("Generic Exception: $e");
      throw CustomException('حدث خطأ غير متوقع');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      // 1. Trigger Facebook Login
      final LoginResult result = await FacebookAuth.instance.login();

      // 2. Check if user cancelled
      if (result.status == LoginStatus.cancelled) {
        throw CustomException('تم إلغاء تسجيل الدخول بواسطة فيسبوك');
      }

      // 3. Check for specific Facebook errors
      if (result.status == LoginStatus.failed) {
        throw CustomException('فشل تسجيل الدخول بواسطة فيسبوك');
      }

      // 4. Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );

      // 5. Sign in to Firebase
      return (await FirebaseAuth.instance.signInWithCredential(
        credential,
      )).user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          'يوجد حساب بالفعل بنفس البريد الإلكتروني ولكن بطريقة تسجيل دخول مختلفة',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomException('حدث خطأ في بيانات الاعتماد من فيسبوك');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException('تسجيل الدخول بفيسبوك غير مفعل حالياً');
      } else if (e.code == 'user-disabled') {
        throw CustomException('تم تعطيل هذا المستخدم');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('تأكد من اتصالك بالإنترنت');
      } else {
        throw CustomException(
          'حدث خطأ أثناء تسجيل الدخول بفيسبوك، يرجى المحاولة لاحقاً',
        );
      }
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
    }
  }
}
