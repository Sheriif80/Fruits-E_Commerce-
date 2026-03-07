import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.showArrow = true,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    required this.path,
  });

  final String title;
  final String iconPath;
  final bool showArrow;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(path);
      },
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(iconPath),
            title: Text(title, style: Appstyles.semiBold13),
            trailing: hasSwitch
                ? Switch(value: switchValue, onChanged: onSwitchChanged)
                : showArrow
                ? const Icon(Icons.arrow_forward_ios, size: 16)
                : null,
          ),
          const Divider(
            height: 1,
            color: const Color(0xFFF1F1F5),
            thickness: 0.9,
          ),
        ],
      ),
    );
  }
}
