import 'package:fruits_e_commerce_app/features/profile/domain/entities/my_orders_entity.dart';

class MyOrdersModel {
  final String orderID;
  final String date;
  final double totalPrice;
  final String status;

  MyOrdersModel({
    required this.orderID,
    required this.date,
    required this.totalPrice,
    required this.status,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) {
    return MyOrdersModel(
      orderID: json['orderID'],
      date: json['date'],
      totalPrice: json['totalPrice'],
      status: json['status'],
    );
  }
  MyOrdersEntity toEntity() {
    return MyOrdersEntity(
      orderID: orderID,
      date: date,
      totalPrice: totalPrice,
      status: status,
    );
  }
}
