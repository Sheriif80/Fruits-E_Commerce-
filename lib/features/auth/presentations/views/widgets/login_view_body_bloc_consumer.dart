import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninLoading) {
          EasyLoading.show();
        }

        if (state is SigninSuccess) {
          EasyLoading.dismiss();
          AppSnackbars.showSuccess(context, message: "تم تسجيل الدخول بنجاح");
        }

        if (state is SigninFailure) {
          EasyLoading.dismiss();
          AppSnackbars.showError(context, message: state.message);
        }
      },
      builder: (context, state) {
        return const LoginViewBody();
      },
    );
  }
}
