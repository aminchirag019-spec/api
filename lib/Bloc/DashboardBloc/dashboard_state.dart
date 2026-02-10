

import 'package:api_learning/globall/utilities.dart';

import '../../models/get_products.dart';
import '../../models/models.dart';

class DashboardState {
  final int? selectedIndex;
  final ApiStatus? status;
   final List<Products>? product;
   final Products? selectedProduct;
   final double? rating;
   final List<Reviews> reviews;
   final double averageRating;



  DashboardState({this.selectedIndex,this.status=ApiStatus.initial,this.product= const [],
  this.selectedProduct,
    this.rating,
    this.reviews =const[],
    this.averageRating = 0.0
  });

  DashboardState copyWith ({
    int ? selectedIndex,
    ApiStatus? status,
    List<Products>? product,
    Products? selectedProduct,
    double? rating,
    List<Reviews>? reviews,
    double? averageRating,
  }) {
    return  DashboardState(
      status: status ?? this.status,
          selectedIndex: selectedIndex ?? this.selectedIndex,
        product: product ?? this.product,
    selectedProduct: selectedProduct ?? this.selectedProduct,
      rating: rating ?? this.rating,
      averageRating: averageRating ?? this.averageRating
    );
  }
}