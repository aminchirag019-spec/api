


import 'package:api_learning/Bloc/cartBloc/cart_event.dart';
import 'package:api_learning/Bloc/cartBloc/cart_state.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/add_to_cart.dart';
class CartBloc extends Bloc<CartEvent, CartState> {
  final AuthRepository repository;

  CartBloc(this.repository) : super(CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<FetchCarts>(_onAllCarts);
  }

  Future<void> _onAllCarts (
      FetchCarts event,
      Emitter<CartState> emit
      ) async {
    print("event recieved for allCarts");
    emit(state.copyWith(status: ApiStatus.loading));

    try {
      final response = await repository.allCarts();

      emit(state.copyWith(
        status: ApiStatus.success,
        allCarts: response,
      )
      );
      print("Api sucees");
    } catch (e) {
      print("Api error $e");
      emit(state.copyWith(status: ApiStatus.failure));
    }

  }

  Future<void> _onAddToCart(
      AddToCartEvent event,
      Emitter<CartState> emit,
      ) async {
    print("event received");

    emit(state.copyWith(status: ApiStatus.loading));

    try {
      final response = await repository.addToCart(
        userId: 1,
        productId: event.productId,
        quantity: event.quantity,
      );

      print("Api success");

      final updatedCart = List<AddToCart>.from(state.cart)
        ..add(response);

      emit(
        state.copyWith(
          status: ApiStatus.success,
          cart: updatedCart,
        ),
      );

      print("Cart Response: ${response.products?.length}");
    } catch (e) {
      print("Api error $e");
      emit(state.copyWith(status: ApiStatus.failure));
    }
  }
  }