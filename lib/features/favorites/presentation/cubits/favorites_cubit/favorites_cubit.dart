import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/features/favorites/domain/repos/favorites_repo.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required this.favoritesRepo}) : super(FavoritesInitial());
  final FavoritesRepo favoritesRepo;
  List<ProductEntity> favoriteProducts = [];

  Future<void> getFavoriteProducts() async {
    emit(FavoritesLoading());
    final result = await favoritesRepo.getFavoriteProducts();
    result.fold(
      (failure) {
        emit(FavoritesFailure(message: failure.message));
      },
      (products) {
        favoriteProducts = products;
        emit(FavoritesLoaded(products: favoriteProducts));
      },
    );
  }

  void toggleFavorite(ProductEntity product) async {
    // بنشوف هل المنتج ده موجود أصلاً في المفضلة ولا لأ
    final isExist = favoriteProducts.any(
      (p) => p.productID == product.productID,
    );

    if (isExist) {
      // ------ حالة الحذف ------
      // 1. (Optimistic) نحذفه من اللستة محلياً ونعمل ريفريش للـ UI فوراً
      favoriteProducts.removeWhere((p) => p.productID == product.productID);
      emit(FavoritesLoaded(products: List.from(favoriteProducts)));

      // 2. نكلم الداتا بيز
      final result = await favoritesRepo.removeFavoriteProduct(
        productId: product.productID,
      );
      result.fold(
        (failure) {
          // 3. لو حصل إيرور (زي النت فصل)، نرجع المنتج للستة تاني ونطلع الإيرور
          favoriteProducts.add(product);
          emit(FavoritesLoaded(products: List.from(favoriteProducts)));
          emit(FavoritesFailure(message: failure.message));
        },
        (success) => null, // لو نجح خلاص إحنا كده كده حدثنا الـ UI
      );
    } else {
      // ------ حالة الإضافة ------
      // 1. (Optimistic) نضيفه للستة محلياً ونعمل ريفريش للـ UI فوراً
      favoriteProducts.add(product);
      emit(FavoritesLoaded(products: List.from(favoriteProducts)));

      // 2. نكلم الداتا بيز
      final result = await favoritesRepo.addFavoriteProduct(
        productId: product.productID,
      );
      result.fold((failure) {
        // 3. لو حصل إيرور، نحذفه من اللستة تاني ونطلع الإيرور
        favoriteProducts.removeWhere((p) => p.productID == product.productID);
        emit(FavoritesLoaded(products: List.from(favoriteProducts)));
        emit(FavoritesFailure(message: failure.message));
      }, (success) => null);
    }
  }

  bool isFavorite(String productId) {
    return favoriteProducts.any((p) => p.productID == productId);
  }
}
