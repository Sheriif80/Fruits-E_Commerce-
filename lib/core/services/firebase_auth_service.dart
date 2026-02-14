import 'dart:developer'; // Better for logging than debugPrint
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/custom_exception.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
