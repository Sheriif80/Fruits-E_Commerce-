import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: HomeViewBody()));
  }
}
