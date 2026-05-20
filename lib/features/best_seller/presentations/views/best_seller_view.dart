import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce_app/features/best_seller/presentations/views/widgets/best_seller_view_body.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: S.of(context).bestSeller),
      body: const BestSellerViewBody(),
    );
  }
}
