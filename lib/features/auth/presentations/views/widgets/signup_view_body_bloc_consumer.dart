import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart'; // 1. Import this
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          EasyLoading.show();
        }

        if (state is SignupSuccess) {
          EasyLoading.dismiss();
          Navigator.of(context).pop();
          AppSnackbars.showSuccess(context, message: "تم التسجيل بنجاح");
        }

        if (state is SignupFailure) {
          EasyLoading.dismiss();
          AppSnackbars.showError(context, message: state.message);
        }
      },
      builder: (context, state) {
        return const SignupViewBody();
      },
    );
  }
}
