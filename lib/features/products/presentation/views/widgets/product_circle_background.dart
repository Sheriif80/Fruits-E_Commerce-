import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:svg_flutter/svg.dart';

class ProductCircleBackground extends StatelessWidget {
  const ProductCircleBackground({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ArchClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.48,
            width: double.infinity,
            color: const Color(0xFFF3F5F7),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: imagePath,
                width: MediaQuery.of(context).size.width * 0.8,
                placeholder: (context, url) => const Center(
                  child: CustomLoadingIndicator(width: 20, height: 20),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                Assets.imagesBackIcon,
                width: 9,
                height: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ArchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 60);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
