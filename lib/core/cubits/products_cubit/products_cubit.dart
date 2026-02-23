import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  int productsCount = 0;

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getAllProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsLoaded(products: products)),
    );
  }

  Future<void> getBestSellerProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellerProducts();
    result.fold((failure) => emit(ProductsFailure(message: failure.message)), (
      products,
    ) {
      productsCount += products.length;
      emit(ProductsLoaded(products: products));
    });
  }
}
