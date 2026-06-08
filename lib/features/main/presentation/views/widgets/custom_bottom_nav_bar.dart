import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/main/domain/entities/nav_bar_item_entity.dart';
import 'package:fruits_e_commerce_app/features/main/presentation/views/widgets/nav_bar_item.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

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
    final localizedNames = [
      S.of(context).homeTab,
      S.of(context).productsTab,
      S.of(context).cartTab,
      S.of(context).profileTab,
    ];
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
                      localizedName: localizedNames[index],
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
