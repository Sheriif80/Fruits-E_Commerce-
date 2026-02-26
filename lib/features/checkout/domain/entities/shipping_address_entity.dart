class ShippingAddressEntity {
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String? appartment;

  ShippingAddressEntity({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    this.appartment,
  });
}
