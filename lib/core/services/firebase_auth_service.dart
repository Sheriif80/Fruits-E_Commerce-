import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fruits_e_commerce_app/core/errors/custom_exception.dart'; // For debugPrint

class FirebaseAuthService {
  // 1. Create an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 2. Stream to listen to auth state changes (User Login/Logout)
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 3. Get current user
  User? get currentUser => _auth.currentUser;

  /// **Sign Up with Email & Password**
  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        // You can throw a custom exception here to show in UI
        throw CustomException('Email already in use');
      } else if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        throw CustomException('Weak password');
      } else if (e.code == 'network-request-failed') {
        debugPrint("An error occurred: $e");
        throw CustomException('تأكد من الاتصال بالانترنت');
      }
      rethrow; // Pass other errors up
    } catch (e) {
      debugPrint("An error occurred: $e");
      return null;
    }
  }

  /// **Sign In with Email & Password**
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        debugPrint('Invalid email or password.');
        throw CustomException('Invalid email or password');
      } else if (e.code == 'invalid-credential') {
        // Newer Firebase error code
        debugPrint('Invalid email or password.');
        throw CustomException('Invalid email or password');
      }
      rethrow;
    } catch (e) {
      debugPrint("An error occurred: $e");
      return null;
    }
  }

  /// **Sign Out**
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// **Password Reset Email**
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error sending password reset email: ${e.code}");
      throw CustomException('Error sending password reset email');
    }
  }
}
