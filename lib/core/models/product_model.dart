import 'dart:io';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/models/review_model.dart';

class ProductModel {
  final String code;
  final String name;
  final String description;
  final File image;
  final num price;
  final bool isFeatured;
  final String? imageURL;
  final int expiryDateMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final int numberOfRatings;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    required this.code,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isFeatured,
    required this.imageURL,
    required this.expiryDateMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.avgRating,
    required this.numberOfRatings,
    required this.reviews,
    required this.sellingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    code: json['code'],
    name: json['name'],
    description: json['description'],
    image: json['image'],
    price: json['price'],
    isFeatured: json['isFeatured'],
    imageURL: json['imageURL'],
    expiryDateMonths: json['expiryDateMonths'],
    isOrganic: json['isOrganic'],
    numberOfCalories: json['numberOfCalories'],
    unitAmount: json['unitAmount'],
    avgRating: json['avgRating'],
    numberOfRatings: json['numberOfRatings'],
    reviews: json['reviews'] == null
        ? []
        : List<ReviewModel>.from(
            json['reviews'].map((x) => ReviewModel.fromJson(x)),
          ),
    sellingCount: json['sellingCount'],
  );

  ProductEntity toEntity() => ProductEntity(
    code: code,
    name: name,
    description: description,
    image: image,
    price: price,
    isFeatured: isFeatured,
    imageURL: imageURL,
    expiryDateMonths: expiryDateMonths,
    isOrganic: isOrganic,
    numberOfCalories: numberOfCalories,
    unitAmount: unitAmount,
    avgRating: avgRating,
    numberOfRatings: numberOfRatings,
    reviews: reviews.map((e) => e.toEntity()).toList(),
  );

  toMap() => {
    "code": code,
    "name": name,
    "description": description,
    "imageURL": imageURL,
    "price": price,
    "isFeatured": isFeatured,
    "expiryDateMonths": expiryDateMonths,
    "isOrganic": isOrganic,
    "numberOfCalories": numberOfCalories,
    "unitAmount": unitAmount,
    "avgRating": avgRating,
    "numberOfRatings": numberOfRatings,
    "reviews": reviews.map((e) => e.toJson()).toList(),
    "sellingCount": sellingCount,
  };
}
