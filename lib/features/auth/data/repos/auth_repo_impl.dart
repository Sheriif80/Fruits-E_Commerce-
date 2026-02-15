import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/custom_exception.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';
import 'package:fruits_e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/core/utils/app_end_points.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final User user = await firebaseAuthService.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
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
  }) async {
    try {
      final User user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinwithGoogle() async {
    try {
      final User user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinwithFacebook() async {
    try {
      final User user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: AppEndPoints.addUserData,
      data: user.toMap(),
    );
  }
}
