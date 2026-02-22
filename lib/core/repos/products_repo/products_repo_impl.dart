import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/models/product_model.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/products_repo.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';
import 'package:fruits_e_commerce_app/core/utils/app_end_points.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failures, List<ProductEntity>>> getAllProducts() async {
    try {
      final data =
          await databaseService.getData(path: AppEndPoints.getProducts)
              as List<Map<String, dynamic>>;
      final List<ProductModel> products = data
          .map((e) => ProductModel.fromJson(e))
          .toList();
      final List<ProductEntity> productsEntity = products
          .map((e) => e.toEntity())
          .toList();

      return right(productsEntity);
    } catch (e) {
      log("An error occurred: ${e.toString()}");
      return left(ServerFailure("An error occurred, please try again later"));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellerProducts() async {
    // TODO: implement getBestSellerProducts
    throw UnimplementedError();
  }
}
