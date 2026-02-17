import 'dart:convert';

import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';

UserEntity getUserData() {
  final jsonString = CacheHelper.getData(key: kUserData);
  final jsonData = jsonDecode(jsonString);
  final user = UserModel.fromJson(jsonData);
  return user;
}
