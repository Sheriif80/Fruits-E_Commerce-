import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';

class ProductModel {
  final String code;
  final String productID;
  final String name;
  final String description;
  final num price;
  final bool isFeatured;
  final String? imageURL;
  final int expiryDateMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final int numberOfRatings;
  final int sellingCount;

  ProductModel({
    required this.code,
    required this.productID,
    required this.name,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.imageURL,
    required this.expiryDateMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.avgRating,
    required this.numberOfRatings,
    required this.sellingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    code: json['code'],
    productID: json['productID'],
    name: json['name'],
    description: json['description'],
    price: json['price'],
    isFeatured: json['isFeatured'],
    imageURL: json['imageURL'],
    expiryDateMonths: json['expiryDateMonths'],
    isOrganic: json['isOrganic'],
    numberOfCalories: json['numberOfCalories'],
    unitAmount: json['unitAmount'],
    avgRating: json['avgRating'],
    numberOfRatings: json['numberOfRatings'],
    sellingCount: json['sellingCount'],
  );

  ProductEntity toEntity() => ProductEntity(
    code: code,
    productID: productID,
    name: name,
    description: description,
    price: price,
    isFeatured: isFeatured,
    imageURL: imageURL,
    expiryDateMonths: expiryDateMonths,
    isOrganic: isOrganic,
    numberOfCalories: numberOfCalories,
    unitAmount: unitAmount,
    avgRating: avgRating,
    numberOfRatings: numberOfRatings,
  );

  toMap() => {
    "code": code,
    "productID": productID,
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
    "sellingCount": sellingCount,
  };
}
