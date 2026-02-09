import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
    this.isVisible = false,
  });
  final String image;
  final String backgroundImage;

  final Widget title;
  final Widget subtitle;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    CacheHelper.saveData(
                      key: kIsOnBoardingVisible,
                      value: true,
                    );

                    GoRouter.of(context).pushReplacement(AppRoutes.loginView);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("تخط"),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(40),
        title,
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: subtitle,
        ),
      ],
    );
  }
}
