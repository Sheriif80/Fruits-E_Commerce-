import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/products/domain/repos/reviews_repo.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/reviews_view_body.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddReviewCubit>(
          create: (context) => AddReviewCubit(getIt<ReviewsRepo>()),
        ),
        BlocProvider<GetReviewsCubit>(
          create: (context) =>
              GetReviewsCubit(getIt<ReviewsRepo>())
                ..getReviews(productCode: productEntity.code),
        ),
      ],

      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: buildAppBar(
            context: context,
            title: S.of(context).reviews,
            isNotificationVisible: false,
          ),
          body: ReviewsViewBody(productEntity: productEntity),
        ),
      ),
    );
  }
}
