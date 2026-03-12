import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<ProductEntity>>> searchProducts({
    required String query,
  });
}
