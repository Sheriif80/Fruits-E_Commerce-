import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/nav_bar_item_entity.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/active_item.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/in_active_item.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.isSelected, required this.item});
  final bool isSelected;
  final NavBarItemEntity item;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(image: item.activeIcon)
        : InActiveItem(image: item.inActiveIcon);
  }
}
