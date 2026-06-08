import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.onSaved,
    this.onChanged,
    this.obsecureText = false,
    this.inputFormatters,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool obsecureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: obsecureText,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).fieldRequired;
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hint: Text(hintText),
        hintStyle: Appstyles.bold13.copyWith(
          color: context.isDarkMode ? Colors.white : const Color(0xFF949D9E),
        ),
        fillColor: context.isDarkMode
            ? AppColors.darkContainer
            : const Color(0xFFF9FAFA),
        filled: true,

        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() => OutlineInputBorder(
    borderSide: const BorderSide(width: 0.4),
    borderRadius: BorderRadius.circular(4),
  );
}
