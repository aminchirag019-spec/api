
abstract class DashboardEvent {}

class Selection extends DashboardEvent {
  final int index;

  Selection(this.index);
}

class GetProduct extends DashboardEvent {}
class GetProductDetails extends DashboardEvent{
  final int id;
  GetProductDetails(this.id);
}