import 'package:bloc/bloc.dart';

import '../../../domines/entites/CartItemEntity.dart';
part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItemEntity) {
    emit(CartItemUpdate(cartItemEntity));
  }
}
