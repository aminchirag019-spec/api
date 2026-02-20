
class CheckoutState {
  final int step; // 0 = Shipping, 1 = Payment, 2 = Completed
  CheckoutState(this.step);
}