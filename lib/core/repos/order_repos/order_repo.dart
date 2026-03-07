import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/profile/domain/entities/my_orders_entity.dart';

abstract class OrderRepo {
  Future<Either<Failures, void>> addOrder({
    required OrderInputEntity orderEntity,
  });

  Future<Either<Failures, List<MyOrdersEntity>>> getMyOrders({
    required String userID,
  });
}
