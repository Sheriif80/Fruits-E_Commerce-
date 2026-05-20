import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_user_data.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/products/domain/entities/review_entity.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/cubits/get_reviews_cubit/get_reviews_cubit.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';

class AddReviewForm extends StatefulWidget {
  const AddReviewForm({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<AddReviewForm> createState() => _AddReviewFormState();
}

class _AddReviewFormState extends State<AddReviewForm> {
  String? description;
  num? rating;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: s.reviewHint,
            onChanged: (value) {
              description = value;
            },
          ),
          const Gap(16),
          CustomTextFormField(
            hintText: s.ratingHint,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              rating = num.tryParse(value);
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          ),
          const Gap(16),

          BlocConsumer<AddReviewCubit, AddReviewState>(
            listener: (context, state) {
              if (state is AddReviewSuccess) {
                context.read<GetReviewsCubit>().getReviews(
                  productCode: widget.productEntity.code,
                );
              }
            },

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

              if (state is AddReviewSuccess) {
                return Center(child: Text(s.reviewSubmitted));
              }

              return CustomButton(
                text: s.submitReview,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AddReviewCubit>().addReview(
                      productCode: widget.productEntity.code,
                      review: ReviewEntity(
                        name: getUserData().name!,
                        description: description!,
                        rating: rating!,
                        image: ".",
                        date: DateTime.now().toString().substring(0, 19),
                      ),
                    );
                    formKey.currentState!.reset();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
