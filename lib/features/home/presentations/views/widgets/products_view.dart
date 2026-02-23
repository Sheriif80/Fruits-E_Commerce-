import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/products_repo.dart';
import 'package:fruits_e_commerce_app/core/services/get_it_service.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/prodcts_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt.get<ProductsRepo>())..getAllProducts(),
      child: Scaffold(body: SafeArea(child: ProdctsViewBody())),
    );
  }
}
