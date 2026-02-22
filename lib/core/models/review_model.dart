import 'package:fruits_e_commerce_app/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String description;
  final String date;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.date,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) => ReviewModel(
    name: entity.name,
    image: entity.image,
    rating: entity.rating,
    description: entity.description,
    date: entity.date,
  );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    name: json['name'],
    image: json['image'],
    rating: json['rating'],
    description: json['description'],
    date: json['date'],
  );

  ReviewEntity toEntity() => ReviewEntity(
    name: name,
    image: image,
    rating: rating,
    description: description,
    date: date,
  );

  toJson() => {
    'name': name,
    'image': image,
    'rating': rating,
    'description': description,
    'date': date,
  };
}
