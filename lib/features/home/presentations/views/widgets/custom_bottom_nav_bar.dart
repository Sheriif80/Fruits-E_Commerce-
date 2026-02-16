import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:svg_flutter/svg.dart';

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
      child: Row(),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? const ActiveItem(image: Assets.imagesNavBarIconsHome)
        : const InActiveItem();
  }
}

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.imagesNavBarIconsHome);
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}
