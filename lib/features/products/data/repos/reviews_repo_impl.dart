import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/review_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/models/review_model.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';
import 'package:fruits_e_commerce_app/core/utils/app_end_points.dart';
import 'package:fruits_e_commerce_app/features/products/domain/repos/reviews_repo.dart';

class ReviewsRepoImpl implements ReviewsRepo {
  final DatabaseService _databaseService;
  ReviewsRepoImpl({required DatabaseService databaseService})
    : _databaseService = databaseService;
  @override
  Future<Either<Failures, void>> addReview({
    required String productCode,
    required ReviewEntity review,
  }) async {
    try {
      final productDocId = await _getProductDocId(productCode);
      await _databaseService.addData(
        path:
            "${AppEndPoints.getProducts}/$productDocId/${AppEndPoints.addReview}",
        data: ReviewModel.fromEntity(review).toJson(),
        documentID: productDocId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<ReviewEntity>>> getReviews(
    String productCode,
  ) async {
    try {
      final productDocId = await _getProductDocId(productCode);
      final data = await _databaseService.getData(
        path:
            "${AppEndPoints.getProducts}/$productDocId/${AppEndPoints.addReview}",
        query: {"orderBy": "date", "descending": true},
      );
      final List<ReviewModel> reviews = data
          .map<ReviewModel>((e) => ReviewModel.fromJson(e))
          .toList();
      final List<ReviewEntity> reviewsEntity = reviews
          .map<ReviewEntity>((e) => e.toEntity())
          .toList();
      return Right(reviewsEntity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<String> _getProductDocId(String productCode) async {
    final List<Map<String, dynamic>> data = await _databaseService.getData(
      path: "products",
      query: {"field": "code", "isEqualTo": productCode, "limit": 1},
    );

    if (data.isEmpty) {
      throw Exception("Product not found");
    }

    final snapshot = await FirebaseFirestore.instance
        .collection("products")
        .where("code", isEqualTo: productCode)
        .limit(1)
        .get();

    return snapshot.docs.first.id;
  }
}
