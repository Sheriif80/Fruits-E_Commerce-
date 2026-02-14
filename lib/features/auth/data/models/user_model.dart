import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name, required super.userId});

  factory UserModel.fromFirebaseUser(User user) =>
      UserModel(email: user.email ?? '', name: '', userId: user.uid);
}
