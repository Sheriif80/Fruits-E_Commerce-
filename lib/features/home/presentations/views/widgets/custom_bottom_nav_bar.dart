import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/nav_bar_item_entity.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navBarItems
            .map((e) => NavBarItem(isSelected: false, item: e))
            .toList(),
      ),
    );
  }
}
