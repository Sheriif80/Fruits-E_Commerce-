import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/reviews_list_view.dart';

class ReviewsListViewBlocBuilder extends StatelessWidget {
  const ReviewsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewsCubit, GetReviewsState>(
      builder: (context, state) {
        if (state is GetReviewsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
        if (state is GetReviewsError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        if (state is GetReviewsSuccess) {
          return ReviewsListView(reviews: state.reviews);
        }
        return const SliverToBoxAdapter(
          child: Center(child: CustomLoadingIndicator()),
        );
      },
    );
  }
}
