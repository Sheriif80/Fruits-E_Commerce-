import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/home_view.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/products_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  late final List<Widget> screens = [const HomeView(), const ProductsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: selectedIndex, children: screens),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
