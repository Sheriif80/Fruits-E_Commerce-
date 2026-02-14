import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/or_divider.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/password_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/social_login_button.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const Gap(24),
              CustomTextFormField(
                onSaved: (value) {
                  _email = value!;
                },
                keyboardType: TextInputType.emailAddress,
                hintText: 'البريد الإلكتروني',
              ),
              const Gap(16),
              PasswordTextField(
                onSaved: (value) {
                  _password = value!;
                },
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: .end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: Appstyles.bold13.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              CustomButton(
                text: "تسجيل الدخول",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    BlocProvider.of<SigninCubit>(
                      context,
                    ).signInWithEmailAndPassword(
                      email: _email,
                      password: _password,
                    );
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                },
              ),
              const Gap(24),
              const DontHaveAnAccountWidget(),
              const Gap(24),
              const OrDivider(),
              const Gap(31),
              SocialLoginButton(
                image: Assets.imagesGoogleIcon,
                title: "تسجيل بواسطة جوجل",
                onPressed: () {
                  BlocProvider.of<SigninCubit>(context).signinWithGoogle();
                },
              ),
              const Gap(16),
              SocialLoginButton(
                image: Assets.imagesAppleIcon,
                title: "تسجيل بواسطة أبل",
                onPressed: () {},
              ),
              const Gap(16),
              SocialLoginButton(
                image: Assets.imagesFacebookIcon,
                title: "تسجيل بواسطة فيسبوك",
                onPressed: () {},
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
