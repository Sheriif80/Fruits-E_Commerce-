import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/main/domain/entities/nav_bar_item_entity.dart';
import 'package:fruits_e_commerce_app/features/main/presentation/views/widgets/active_item.dart';
import 'package:fruits_e_commerce_app/features/main/presentation/views/widgets/in_active_item.dart';

class NavBarItem extends StatefulWidget {
  const NavBarItem({
    super.key,
    required this.isSelected,
    required this.item,
    required this.localizedName,
  });
  final bool isSelected;
  final NavBarItemEntity item;
  final String localizedName;

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.linearToEaseOut,
        switchOutCurve: Curves.easeOutCubic,
        transitionBuilder: (child, animation) {
          final scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
          );
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: scaleAnimation, child: child),
          );
        },
        child: widget.isSelected
            ? ActiveItem(
                key: ValueKey('active_${widget.item.name}'),
                image: widget.item.activeIcon,
                name: widget.localizedName,
              )
            : InActiveItem(
                key: ValueKey('inactive_${widget.item.name}'),
                image: widget.item.inActiveIcon,
              ),
      ),
    );
  }
}
