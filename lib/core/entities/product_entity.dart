class ProductEntity {
  final String code;
  final String productID;
  final String name;
  final String description;
  String? imageURL;
  final num price;
  final bool isFeatured;
  final int expiryDateMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final int numberOfRatings;

  ProductEntity({
    required this.code,
    required this.productID,
    required this.name,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageURL,
    required this.expiryDateMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.avgRating,
    required this.numberOfRatings,
  });
}
