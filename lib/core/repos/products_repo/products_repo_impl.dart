import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  @override
  Future<Either<Failures, List<ProductEntity>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellerProducts() {
    // TODO: implement getBestSellerProducts
    throw UnimplementedError();
  }
}
