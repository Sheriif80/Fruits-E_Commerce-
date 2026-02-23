import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/nav_bar_item_entity.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: Row(
        children: navBarItems
            .asMap()
            .map(
              (index, item) => MapEntry(
                index,
                Expanded(
                  flex: currentIndex == index ? 3 : 2,
                  child: GestureDetector(
                    onTap: () => onItemSelected(index),
                    child: NavBarItem(
                      item: item,
                      isSelected: index == currentIndex,
                    ),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
