import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          mainAxisAlignment: .end,
          children: [
            SvgPicture.asset(Assets.imagesPlant)
                .animate()
                .fadeIn(duration: 800.ms)
                .slide(
                  begin: const Offset(-0.5, -0.5),
                  end: Offset.zero,
                  duration: 800.ms,
                  curve: Curves.easeOut,
                ),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo)
            .animate()
            .fadeIn(duration: 800.ms)
            .scale(
              begin: const Offset(0.5, 0.5), // Starts at 50% size
              end: const Offset(1.0, 1.0), // Ends at 100% size
              duration: 800.ms,
              curve: Curves.easeOutBack, // Gives it a little bounce at the end
            ),
        SvgPicture.asset(Assets.imagesBottom, fit: BoxFit.fill)
            .animate(
              // This makes the floating effect repeat indefinitely
              onPlay: (controller) => controller.repeat(reverse: true),
            )
            .fadeIn(duration: 1000.ms)
            .moveY(
              begin: 0,
              end: -15, // Floats up by 15 pixels
              duration: 1500.ms,
              curve: Curves.easeInOut,
            ),
      ],
    );
  }
}
