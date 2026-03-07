import 'package:fruits_e_commerce_app/features/profile/domain/entities/my_orders_entity.dart';

class MyOrdersModel {
  final String orderID;
  final String date;
  final String totalPrice;

  MyOrdersModel({
    required this.orderID,
    required this.date,
    required this.totalPrice,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) {
    return MyOrdersModel(
      orderID: json['orderID'],
      date: json['date'],
      totalPrice: json['totalPrice'],
    );
  }
  MyOrdersEntity toEntity() {
    return MyOrdersEntity(orderID: orderID, date: date, totalPrice: totalPrice);
  }
}
