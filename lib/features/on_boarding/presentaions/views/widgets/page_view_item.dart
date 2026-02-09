import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String backgroundImage;

  final Widget title;
  final Widget subtitle;

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
              const Padding(
                padding: const EdgeInsets.all(16),
                child: const Text("تخط"),
              ),
            ],
          ),
        ),
        const Gap(55),
        Padding(padding: const EdgeInsets.all(16), child: title),
        const Gap(20),
        Padding(padding: const EdgeInsets.all(16), child: subtitle),
      ],
    );
  }
}
