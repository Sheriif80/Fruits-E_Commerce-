import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/nav_bar_item_entity.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/nav_bar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
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
            .asMap()
            .map(
              (index, item) => MapEntry(
                index,
                Expanded(
                  flex: selectedIndex == index ? 3 : 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: NavBarItem(
                      item: item,
                      isSelected: index == selectedIndex,
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
