import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/repos/order_repos/order_repo.dart';
import 'package:fruits_e_commerce_app/core/services/database_service.dart';
import 'package:fruits_e_commerce_app/core/utils/app_end_points.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl({required this.databaseService});
  @override
  Future<Either<Failures, void>> addOrder({
    required OrderInputEntity orderEntity,
  }) async {
    try {
      // making a model before adding it, to get the orderID as a documentID
      final orderModel = OrderModel.fromEntity(orderEntity);
      await databaseService.addData(
        path: AppEndPoints.addOrders,
        data: orderModel.toJson(),
        documentID: orderModel.orderID,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
