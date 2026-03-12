import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_search_text_field.dart';
import 'package:fruits_e_commerce_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:fruits_e_commerce_app/features/search/presentation/views/widgets/search_results_bloc_builder.dart';
import 'package:gap/gap.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(22),
            CustomSearchTextField(
              autofocus: true,
              onChanged: (value) {
                context.read<SearchCubit>().searchProducts(query: value);
              },
            ),
            const Gap(22),
            const SearchResultsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
