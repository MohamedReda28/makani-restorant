import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entitys/ProductEntity.dart';
import '../../../domines/entites/CardEntity.dart';
import '../../../domines/entites/CartItemEntity.dart';
part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit() : super(CartCubitInitial());

  CartEntity cartEntity = CartEntity([]);
  @override
  void AddProduct(ProductEntity productEntity) {
    bool isExis = cartEntity.isExis(productEntity);
    var carsItem = cartEntity.gitProduct(productEntity);
    if (isExis) {
      carsItem.increaseQuantity();
    } else {
      cartEntity.addCardItem(carsItem);
    }
    emit(CartItemAdd());
  }

  void RemoveCardItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemove());
  }
}
