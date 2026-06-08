import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/forgot_password_view_body.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class ForgotPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          EasyLoading.dismiss();
          AppSnackbars.showSuccess(
            context,
            message: S.of(context).passwordResetSent,
          );
          Navigator.of(context).pop();
        }

        if (state is ResetPasswordFailure) {
          EasyLoading.dismiss();
          AppSnackbars.showError(context, message: state.message);
        }
        if (state is ResetPasswordLoading) {
          EasyLoading.show();
        }
      },
      builder: (context, state) {
        return const ForgotPasswordViewBody();
      },
    );
  }
}
