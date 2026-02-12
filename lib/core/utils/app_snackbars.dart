import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class AppSnackbars {
  // Success SnackBar
  static void showSuccess(BuildContext context, {required String message}) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.success,
      duration: const Duration(seconds: 2),
      mobileSnackBarPosition: MobileSnackBarPosition.bottom, // or top
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  // Error SnackBar
  static void showError(BuildContext context, {required String message}) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.error,
      duration: const Duration(seconds: 2),
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
  }

  // Warning SnackBar
  static void showWarning(BuildContext context, {required String message}) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.warning,
      duration: const Duration(seconds: 2),
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
  }

  // Info SnackBar
  static void showInfo(BuildContext context, {required String message}) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.info,
      duration: const Duration(seconds: 2),
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
  }

  // Custom Styled SnackBar (Optional)
  static void showCustom(
    BuildContext context, {
    required String message,
    required IconData icon,
    Color backgroundColor = Colors.black,
  }) {
    AnimatedSnackBar(
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
      duration: const Duration(seconds: 2),
    ).show(context);
  }
}
