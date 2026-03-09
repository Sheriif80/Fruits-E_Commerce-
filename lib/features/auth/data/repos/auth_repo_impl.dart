import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/errors/custom_exception.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';
import 'package:fruits_e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/services/push_notification_service.dart';
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
    User? user;
    try {
      user = await firebaseAuthService.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = await getIt<PushNotificationService>().getToken();
      final userEntity = UserEntity(
        name: name,
        email: email.toLowerCase(),
        userId: user.uid,
        fcmToken: token,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteAccount();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteAccount();
      }
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

      UserEntity userEntity = await getUserData(userId: user.uid);
      // fetchi fcm token and save it if it is different
      // (this will happen if the user is signing in from a different device)
      final token = await getIt<PushNotificationService>().getToken();
      if (token != null && userEntity.fcmToken != token) {
        userEntity = UserEntity(
          name: userEntity.name,
          email: userEntity.email,
          userId: userEntity.userId,
          fcmToken: token,
        );
        await addUserData(user: userEntity);
      }
      await saveUserDataLocal(user: userEntity);
      return right(userEntity);
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      final token = await getIt<PushNotificationService>().getToken();
      UserEntity userEntity = UserModel.fromFirebaseUser(user, fcmToken: token);
      final bool isUserExists = await databaseService.ifDataExists(
        path: AppEndPoints.isUserExist,
        docID: user.uid,
      );
      if (isUserExists) {
        userEntity = await getUserData(userId: user.uid);
        if (token != null && userEntity.fcmToken != token) {
          userEntity = UserEntity(
            name: userEntity.name,
            email: userEntity.email,
            userId: userEntity.userId,
            fcmToken: token,
          );
          await addUserData(user: userEntity);
        }
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserDataLocal(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteAccount();
      }
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteAccount();
      }
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinwithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      final token = await getIt<PushNotificationService>().getToken();
      UserEntity userEntity = UserModel.fromFirebaseUser(user, fcmToken: token);
      final bool isUserExists = await databaseService.ifDataExists(
        path: AppEndPoints.isUserExist,
        docID: user.uid,
      );
      if (isUserExists) {
        userEntity = await getUserData(userId: user.uid);
        if (token != null && userEntity.fcmToken != token) {
          userEntity = UserEntity(
            name: userEntity.name,
            email: userEntity.email,
            userId: userEntity.userId,
            fcmToken: token,
          );
          await addUserData(user: userEntity);
        }
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserDataLocal(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteAccount();
      }
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteAccount();
      }
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: AppEndPoints.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentID: user.userId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    final data = await databaseService.getData(
      path: AppEndPoints.getUserData,
      docID: userId,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future saveUserDataLocal({required UserEntity user}) async {
    final jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

    await CacheHelper.saveData(key: kUserData, value: jsonData);
  }

  @override
  Future<Either<Failures, void>> signOut() async {
    try {
      // Making the token empty for the user before signing out.
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        UserEntity userEntity = await getUserData(userId: user.uid);
        // Updataing the fcm token to empty.
        userEntity = UserEntity(
          name: userEntity.name,
          email: userEntity.email,
          userId: userEntity.userId,
          fcmToken: '',
        );
        await addUserData(user: userEntity);
      }

      // delete fcm token from device
      await FirebaseMessaging.instance.deleteToken();

      await firebaseAuthService.signOut();
      await CacheHelper.removeData(key: kUserData);
      return right(null);
    } on CustomException catch (e) {
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<Either<Failures, void>> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuthService.sendPasswordResetEmail(email);
      return right(null);
    } on CustomException catch (e) {
      log("An error occurred: ${e.message}");
      return left(ServerFailure(e.message));
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }
}
