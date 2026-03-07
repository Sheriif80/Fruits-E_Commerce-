import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/review_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';

abstract class ReviewsRepo {
  Future<Either<Failures, List<ReviewEntity>>> getReviews(String productCode);

  Future<Either<Failures, void>> addReview({
    required String productCode,
    required ReviewEntity review,
  });
}
