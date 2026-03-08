import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(getIt.get<AuthRepo>()),
      child: Container(
        height: 41,
        width: double.infinity,
        color: context.isDarkMode
            ? AppColors.darkContainer
            : const Color(0xFFEBF9F1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            BlocConsumer<SignOutCubit, SignOutState>(
              listener: (context, state) {
                if (state is SignOutSuccess) {
                  EasyLoading.dismiss();
                  GoRouter.of(context).go(AppRoutes.loginView);
                }
                if (state is SignOutFailure) {
                  EasyLoading.showError(state.message);
                }
                if (state is SignOutLoading) {
                  EasyLoading.show();
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: Text(
                          'تسجيل الخروج',
                          style: Appstyles.bold16.copyWith(),
                        ),
                        content: const Text('هل انت متأكد من تسجيل الخروج؟'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(dialogContext),
                            child: const Text(
                              'لا',
                              style: Appstyles.semiBold16,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                context.read<SignOutCubit>().signOut(),
                            child: const Text(
                              'نعم',
                              style: Appstyles.semiBold13,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'تسجيل الخروج',
                    style: Appstyles.semiBold13.copyWith(
                      color: context.isDarkMode
                          ? Colors.white
                          : const Color(0xFF1B5E37),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            SvgPicture.asset(Assets.imagesProfileIconsLogout),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
