import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/features/products/domain/entities/review_entity.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_user_data.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:gap/gap.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? description;
  num? rating;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Gap(16),
              CustomTextFormField(
                hintText: "اكتب تعليقك...",
                onChanged: (value) {
                  description = value;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: "اكتب تقيمك...",
                keyboardType: .number,
                onChanged: (value) {
                  rating = num.parse(value);
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: "اكتب تعليقك...",
                onChanged: (value) {
                  image = value;
                },
              ),
              const Gap(16),

              BlocBuilder<AddReviewCubit, AddReviewState>(
                builder: (context, state) {
                  if (state is AddReviewError) {
                    return Text(state.message);
                  }
                  if (state is AddReviewLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }

                  return CustomButton(
                    text: "ارسال التقييم",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AddReviewCubit>().addReview(
                          productCode: widget.productEntity.code,
                          review: ReviewEntity(
                            name: getUserData().name!,
                            description: description!,
                            rating: rating!,
                            image: image!,
                            date: DateTime.now().toString().substring(0, 19),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
