
import '../../models/add_to_cart.dart';

class CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;
  final int quantity;

  AddToCartEvent({required this.productId,required this.quantity});
}

class FetchCarts extends CartEvent {}
