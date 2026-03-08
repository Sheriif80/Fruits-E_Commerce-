import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/add_review_form.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/reviews_list_view_bloc_builder.dart';
import 'package:gap/gap.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Gap(16),
                AddReviewForm(productEntity: productEntity),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: Gap(16)),
          const ReviewsListViewBlocBuilder(),
        ],
      ),
    );
  }
}
