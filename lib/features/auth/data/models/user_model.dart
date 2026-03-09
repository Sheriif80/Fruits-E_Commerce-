import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.userId,
    super.fcmToken,
  });

  factory UserModel.fromFirebaseUser(User user, {String? fcmToken}) =>
      UserModel(
        email: user.email ?? '',
        name: user.displayName ?? '',
        userId: user.uid,
        fcmToken: fcmToken,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json['email'] ?? '',
    name: json['name'] ?? '',
    userId: json['userId'] ?? '',
    fcmToken: json['fcmToken'] ?? '',
  );

  factory UserModel.fromEntity(UserEntity user) => UserModel(
    email: user.email,
    name: user.name,
    userId: user.userId,
    fcmToken: user.fcmToken,
  );

  toMap() => {
    'name': name,
    'email': email,
    'userId': userId,
    'fcmToken': fcmToken,
  };
}
