import 'package:fruits_e_commerce_app/core/entities/review_entity.dart';

class ProductEntity {
  final String code;
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
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.code,
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
    required this.reviews,
  });
}
