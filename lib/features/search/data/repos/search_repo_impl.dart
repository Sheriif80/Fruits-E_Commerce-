import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/models/product_model.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';
import 'package:fruits_e_commerce_app/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final DatabaseService databaseService;

  SearchRepoImpl({required this.databaseService});
  @override
  Future<Either<Failures, List<ProductEntity>>> searchProducts({
    required String query,
  }) async {
    if (query.trim().isEmpty) {
      return right([]);
    }
    try {
      final data = await databaseService.searchData(
        path: 'products',
        field: 'name',
        query: query,
      );

      final List<ProductEntity> products = data.map((item) {
        return ProductModel.fromJson(item).toEntity();
      }).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure("حدث خطأ أثناء البحث"));
    }
  }
}
