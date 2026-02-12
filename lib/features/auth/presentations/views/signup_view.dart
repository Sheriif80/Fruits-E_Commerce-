import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: showCustomAppBar(context, title: "حساب جديد"),

          body: const SignupViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
