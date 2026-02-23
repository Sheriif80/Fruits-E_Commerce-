import 'package:fruits_e_commerce_app/core/entities/review_entity.dart';

num getAvgRating(List<ReviewEntity> reviews) => reviews.isEmpty
    ? 0
    : reviews.map((e) => e.rating).reduce((a, b) => a + b) / reviews.length;
