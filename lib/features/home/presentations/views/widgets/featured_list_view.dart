import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/featured_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(4, (index) => FeaturedItem())),
    );
  }
}
