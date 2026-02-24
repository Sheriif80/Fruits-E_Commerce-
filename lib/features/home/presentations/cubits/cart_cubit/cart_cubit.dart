import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_entity.dart';
import 'package:fruits_e_commerce_app/features/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProdcut(ProductEntity productEntity) {
    final bool isItemInCart = cartEntity.isItemInCart(productEntity);

    if (isItemInCart) {
      cartEntity.cartItems
          .firstWhere((element) => element.productEntity == productEntity)
          .increaseQuantity();
    } else {
      cartEntity.addCartItem(CartItemEntity(productEntity: productEntity));
    }

    emit(CartItemAdded());
  }

  void removeProduct(ProductEntity productEntity) {
    cartEntity.removeCartItem(CartItemEntity(productEntity: productEntity));
    emit(CartItemRemoved());
  }
}
