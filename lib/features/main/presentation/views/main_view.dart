import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:fruits_e_commerce_app/features/main/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/home_view.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/products_view.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/profile_view.dart';

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
    const ProfileView(),
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

          if (state is CartItemRemoved) {
            AppSnackbars.showInfo(context, message: "تم حذف المنتج بنجاح");
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
