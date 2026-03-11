import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';

abstract class FavoritesRepo {
  Future<Either<Failures, void>> addFavoriteProduct({
    required String productId,
  });

  Future<Either<Failures, void>> removeFavoriteProduct({
    required String productId,
  });

  Future<Either<Failures, List<ProductEntity>>> getFavoriteProducts();
}
