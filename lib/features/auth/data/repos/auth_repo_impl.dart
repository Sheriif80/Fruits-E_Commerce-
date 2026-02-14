import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/custom_exception.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final User? user = await firebaseAuthService.signUpWithEmailAndPassword(
        email,
        password,
      );
      return right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final User? user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
      return right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }
}
