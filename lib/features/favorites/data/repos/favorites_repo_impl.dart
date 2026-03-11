import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/custom_exception.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/models/product_model.dart';
import 'package:fruits_e_commerce_app/features/favorites/domain/repos/favorites_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> _getUserDoc() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) throw CustomException('يجب تسجيل الدخول أولاً');
    return _firestore.collection('users').doc(userId);
  }

  @override
  Future<Either<Failures, void>> addFavoriteProduct({
    required String productId,
  }) async {
    try {
      await _getUserDoc().set({
        'favoriteProductsIDs': FieldValue.arrayUnion([productId]),
      }, SetOptions(merge: true));
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getFavoriteProducts() async {
    try {
      final userDoc = await _getUserDoc().get();
      final data = userDoc.data();
      if (data == null ||
          data['favoriteProductsIDs'] == null ||
          (data['favoriteProductsIDs'] as List).isEmpty) {
        return right([]);
      }

      final List<Object> favoriteIds = List<Object>.from(
        data['favoriteProductsIDs'],
      );
      // Getting product data which are in favoriteIds
      final productsSnapshot = await _firestore
          .collection('products')
          .where(FieldPath.documentId, whereIn: favoriteIds)
          .get();

      // 4. ضفنا <ProductEntity> عشان Dart تفهم إن الموديل ده هو الـ Entity
      final List<ProductEntity> favorites = productsSnapshot.docs
          .map<ProductEntity>((doc) {
            // أخدنا نسخة (Copy) من الداتا عشان نعرف نعدل عليها ونضيف الـ ID
            final Map<String, dynamic> productData = Map<String, dynamic>.from(
              doc.data() as Map<dynamic, dynamic>,
            );

            productData['productId'] = doc.id;

            return ProductModel.fromJson(productData).toEntity();
          })
          .toList();

      return right(favorites);
    } catch (e) {
      log("Error getting favorites: $e");
      return left(ServerFailure("حدث خطأ أثناء جلب المفضلة"));
    }
  }

  @override
  Future<Either<Failures, void>> removeFavoriteProduct({
    required String productId,
  }) async {
    try {
      await _getUserDoc().update({
        "favoriteProductsIDs": FieldValue.arrayRemove([productId]),
      });
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure("An error occurred, please try again later"));
    }
  }
}
