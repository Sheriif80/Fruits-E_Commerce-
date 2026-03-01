import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? appartment;

  ShippingAddressModel({
    this.fullName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.appartment,
  });
  factory ShippingAddressModel.fromEntity(
    ShippingAddressEntity shippingAddress,
  ) => ShippingAddressModel(
    fullName: shippingAddress.fullName,
    email: shippingAddress.email,
    phone: shippingAddress.phone,
    address: shippingAddress.address,
    city: shippingAddress.city,
    appartment: shippingAddress.appartment,
  );

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "appartment": appartment,
    };
  }
}
