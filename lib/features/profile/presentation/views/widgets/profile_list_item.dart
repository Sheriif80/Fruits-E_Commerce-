import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.showArrow = true,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  });

  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  final bool showArrow;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(iconPath),
      title: Text(title, style: Appstyles.semiBold13),
      trailing: hasSwitch
          ? Switch(value: switchValue, onChanged: onSwitchChanged)
          : showArrow
          ? const Icon(Icons.arrow_forward_ios, size: 16)
          : null,
    );
  }
}
