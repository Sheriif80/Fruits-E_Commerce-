import 'package:flutter/material.dart';

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
              child: Image.network(
                imagePath,
                width: MediaQuery.of(context).size.width * 0.8,
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
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
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
