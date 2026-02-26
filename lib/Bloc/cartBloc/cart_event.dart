
import '../../models/add_to_cart.dart';

class CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;
  final int quantity;

  AddToCartEvent({required this.productId,required this.quantity});
}

class FetchCarts extends CartEvent {}
class DeleteCartEvent extends CartEvent{
  final int id;
  DeleteCartEvent({required this.id});
}
class LoadUserCartEvent extends CartEvent {
  final int userId;
  final List<AddToCart> cartItems;

  LoadUserCartEvent({
    required this.userId,
    required this.cartItems,
  });
}