

import 'package:api_learning/Bloc/cartBloc/cart_event.dart' hide AddToCart;
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/models/add_to_cart.dart';
import 'package:equatable/equatable.dart';

import '../../models/delete_cart.dart';
import '../../models/get_all_carts.dart';

class CartState extends Equatable{
  final ApiStatus? status;
  final int userId;
  final List<AddToCart> cart;
  final AllCarts? allCarts;
  final DeleteCart? deleteCart;

  CartState({
    this.status=ApiStatus.initial,
    this.cart = const [],
    this.allCarts,
    this.userId =1,
    this.deleteCart
});
  CartState copyWith({
    ApiStatus?status,
    List<AddToCart>?cart,
    AllCarts? allCarts,
    DeleteCart?deleteCart,
    int?userId,
}) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      allCarts: allCarts ?? this.allCarts,
      deleteCart: deleteCart ?? this.deleteCart,
      userId: userId ?? this.userId
    );
  }

  @override
  List<Object?> get props => [
    status,
    cart,
    allCarts,
    deleteCart,
    userId
  ];
}