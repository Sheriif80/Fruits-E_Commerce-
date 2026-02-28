class ShippingAddressEntity {
  String fullName;
  String email;
  String phone;
  String address;
  String city;
  String? appartment;

  ShippingAddressEntity({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    this.appartment,
  });
}
