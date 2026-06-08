import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obsecureText: obsecureText,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      hintText: S.of(context).password,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obsecureText = !obsecureText;
          });
        },
        child: obsecureText == true
            ? const Icon(Icons.visibility)
            : Icon(Icons.visibility_off, color: AppColors.greyColor),
      ),
    );
  }
}
