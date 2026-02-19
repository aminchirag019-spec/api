abstract class DashboardEvent {}

class Selection extends DashboardEvent {
  final int index;

  Selection(this.index);
}

class GetProduct extends DashboardEvent {}

class GetProductDetails extends DashboardEvent {
  final int id;
  GetProductDetails(this.id);
}

class RatingChange extends DashboardEvent {
  final double rating;
  RatingChange(this.rating);
}

class SearchProduct extends DashboardEvent {
  final String search;

  SearchProduct(this.search);
}
class ShippingMethodChanged extends DashboardEvent{
  final int value;
  ShippingMethodChanged(this.value);
}
class CopyAddress extends DashboardEvent{
  final bool value;
  CopyAddress(this.value);
}
class CategoryEvent extends DashboardEvent{
  final int index;
  CategoryEvent(this.index);
}
class OrderStatus extends DashboardEvent{
  final int index;
  OrderStatus(this.index);
}
class RecentText extends DashboardEvent {
  final String text;
  RecentText(this.text);
}