import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/have_an_account_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/password_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/widgets/terms_and_conditions.dart';
import 'package:gap/gap.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String _name, _email, _password;
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
                  _name = value!;
                },
                keyboardType: TextInputType.name,
                hintText: ' الاسم كاملاً',
              ),
              const Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  _email = value!;
                },
                keyboardType: TextInputType.emailAddress,
                hintText: 'البريد الإلكتروني',
              ),
              const Gap(16),
              PasswordTextField(onSaved: (value) => _password = value!),
              const Gap(16),
              const TermsAndConditions(),
              const Gap(30),
              CustomButton(
                text: "إنشاء حساب جديد ",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      _autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                    BlocProvider.of<SignupCubit>(
                      context,
                    ).createUserWithEmailAndPassword(
                      email: _email,
                      password: _password,
                      name: _name,
                    );
                  }
                },
              ),
              const Gap(24),
              const HaveAnAccountWidget(),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
