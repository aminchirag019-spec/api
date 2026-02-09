

import 'package:api_learning/globall/utilities.dart';

import '../../models/get_products.dart';
import '../../models/models.dart';

class DashboardState {
  final int? selectedIndex;
  final ApiStatus? status;
   final List<Products>? product;
   final Products? selectedProduct;


  DashboardState({this.selectedIndex,this.status=ApiStatus.initial,this.product= const [],
  this.selectedProduct,
  });

  DashboardState copyWith ({
    int ? selectedIndex,
    ApiStatus? status,
    List<Products>? product,
    Products? selectedProduct,
  }) {
    return  DashboardState(
      status: status ?? this.status,
          selectedIndex: selectedIndex ?? this.selectedIndex,
        product: product ?? this.product,
    selectedProduct: selectedProduct ?? this.selectedProduct,
    );
  }
}