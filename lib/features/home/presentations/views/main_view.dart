import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_view.dart';
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

  late final List<Widget> screens = [
    const HomeView(),
    const ProductsView(),
    const CartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemAdded) {
            AppSnackbars.showInfo(context, message: "تم اضافة المنتج بنجاح");
          }
        },
        child: Scaffold(
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
        ),
      ),
    );
  }
}
