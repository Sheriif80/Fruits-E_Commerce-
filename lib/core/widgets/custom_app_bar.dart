import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';

AppBar showCustomAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(title, style: Appstyles.bold19, textAlign: .center),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}
