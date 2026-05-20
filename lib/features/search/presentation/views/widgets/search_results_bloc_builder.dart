import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_dummy_product.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruits_e_commerce_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:fruits_e_commerce_app/features/search/presentation/views/widgets/search_results_grid_view.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:svg_flutter/svg.dart';

class SearchResultsBlocBuilder extends StatelessWidget {
  const SearchResultsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(
            child: Column(
              children: [
                const Gap(80),
                SvgPicture.asset(Assets.imagesSearchViewIcon),
                const Gap(20),
                Text(S.of(context).searchStartTyping, style: Appstyles.bold16),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms);
        } else if (state is SearchLoading) {
          return Skeletonizer(
            child: SearchResultsGridView(products: getDummyProducts()),
          );
        } else if (state is SearchSuccess) {
          if (state.products.isEmpty) {
            return Center(
              child: Column(
                children: [
                  const Gap(40),
                  LottieBuilder.asset(
                    'assets/lottie/empty ghost.json',
                    height: 200,
                    width: 200,
                  ),
                  const Gap(20),
                  Text(
                    S.of(context).searchNoResults,
                    style: Appstyles.bold16,
                  ),
                ],
              ).animate().fadeIn(duration: 800.ms),
            );
          }
          return SearchResultsGridView(products: state.products);
        }
        if (state is SearchError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: CustomLoadingIndicator());
      },
    );
  }
}
