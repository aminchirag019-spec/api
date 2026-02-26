


import 'package:api_learning/Bloc/cartBloc/cart_event.dart';
import 'package:api_learning/Bloc/cartBloc/cart_state.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/add_to_cart.dart';
import '../../session/shared_preferences.dart';
class CartBloc extends Bloc<CartEvent, CartState> {
  final AuthRepository repository;

  CartBloc(this.repository) : super(CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<FetchCarts>(_onAllCarts);
    on<DeleteCartEvent>(_onDeleteCart);
    on<LoadUserCartEvent>(_onLoadCartEvent);
  }

  Future<void> _onLoadCartEvent (
      LoadUserCartEvent event,
      Emitter<CartState> emit
      ) async{
    emit(state.copyWith(userId: event.userId,cart: event.cartItems));
  }


  Future<void> _onDeleteCart (
      DeleteCartEvent event,
      Emitter<CartState>emit
      ) async {
    print("Event recieved for deleteCart");
    emit(state.copyWith(status: ApiStatus.loading));

    try {
      final response = await repository.deleteCart(event.id);

      emit(state.copyWith(
        status:ApiStatus.success,
        deleteCart: response,
        cart: []
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ApiStatus.failure
      ));
    }
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
        userId: state.userId,
        productId: event.productId,
        quantity: event.quantity,
      );

      print("Api success");

      final updatedCart = List<AddToCart>.from(state.cart)
        ..add(response);
      await SharedPref.saveCart(state.userId, updatedCart);


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