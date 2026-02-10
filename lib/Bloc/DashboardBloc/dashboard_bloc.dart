
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:api_learning/models/get_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent,DashboardState>{
final AuthRepository repository;

DashboardBloc(this.repository) : super(DashboardState()) {
   on<Selection>(_iconSelection);
  on<GetProduct>(_getProducts);
  on<GetProductDetails>(_getProductDetail);
  on<RatingChange>(_onRatingChange);
}

void _onRatingChange(
    RatingChange event,
    Emitter<DashboardState> emit
    ) async{
  emit(state.copyWith(rating: event.rating));
}


void _iconSelection (
    Selection event,
    Emitter<DashboardState> emit
    ) async {
  try {
    emit(state.copyWith(selectedIndex: event.index));
  }
  catch (e) {
    print("selection error");
  }
}

void _getProducts (
    GetProduct event,
    Emitter<DashboardState> emit
    ) async {
  emit(state.copyWith(
    status: ApiStatus.loading
  ));
  try {
    final response = await repository.products();
    emit(state.copyWith(
      status: ApiStatus.success,
      product: response.products,
    ));
  } catch (e) {
emit(state.copyWith(
  status: ApiStatus.failure
));
  }
}

void _getProductDetail(
    GetProductDetails event,
    Emitter<DashboardState> emit,
    ) async {
  emit(state.copyWith(status: ApiStatus.loading));

  try {
    final product = await repository.productDetails(event.id);

    emit(state.copyWith(
      status: ApiStatus.success,
      selectedProduct: product,
    ));
  } catch (e) {
    emit(state.copyWith(status: ApiStatus.failure));
  }
}

double calculateAverage(List<Reviews> reviews){

  double total = 0.0;
  for(final r in reviews){
    total +=(r.rating ?? 0).toDouble();
  }
  return total / reviews.length;
}
 }