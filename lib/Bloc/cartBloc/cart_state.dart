

import 'package:api_learning/Bloc/cartBloc/cart_event.dart' hide AddToCart;
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/models/add_to_cart.dart';
import 'package:equatable/equatable.dart';

import '../../models/get_all_carts.dart';

class CartState extends Equatable{
  final ApiStatus? status;
  final List<AddToCart> cart;
  final AllCarts? allCarts;

  CartState({
    this.status=ApiStatus.initial,
    this.cart = const [],
    this.allCarts
});
  CartState copyWith({
    ApiStatus?status,
    List<AddToCart>?cart,
    AllCarts? allCarts,

}) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      allCarts: allCarts ?? this.allCarts,
    );
  }

  @override
  List<Object?> get props => [
    status,
    cart,
    allCarts,
  ];
}