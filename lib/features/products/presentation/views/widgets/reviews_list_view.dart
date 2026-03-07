import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/products/domain/entities/review_entity.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/review_item.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reviews});

  final List<ReviewEntity> reviews;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ReviewItem(review: reviews[index]);
      }, childCount: reviews.length),
    );
  }
}
