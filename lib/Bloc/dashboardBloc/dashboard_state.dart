import 'package:api_learning/globall/utilities.dart';
import 'package:equatable/equatable.dart';

import '../../models/get_products.dart';
import '../../models/models.dart';

class DashboardState extends Equatable {
  final int? selectedIndex;
  final ApiStatus status;
  final List<Products>? product;
  final Products? selectedProduct;
  final double? rating;
  final List<Reviews> reviews;
  final double averageRating;
  final List<Products> allProducts;
  final List<Products> filteredProducts;
  final int selectedShipping;
  final bool copyAddress;
  final int selectedCategory;
  final int orderStatus;
  final List<String> recentSearches;
  const DashboardState({
    this.selectedIndex,
    this.status = ApiStatus.initial,
    this.product = const [],
    this.selectedProduct,
    this.rating,
    this.reviews = const [],
    this.averageRating = 0.0,
    this.allProducts = const [],
    this.filteredProducts = const [],
    this.selectedShipping = 0,
    this.copyAddress = false,
    this.selectedCategory = -1,
    this.orderStatus =0,
    this.recentSearches= const [],
  });
  DashboardState copyWith({
    int? selectedIndex,
    ApiStatus? status,
    List<Products>? product,
    Products? selectedProduct,
    double? rating,
    List<Reviews>? reviews,
    double? averageRating,
    List<Products>? allProducts,
    List<Products>? filteredProducts,
    int? selectedShipping,
    bool? copyAddress,
    int ? selectedCategory,
    int ? orderStatus,
List<String> ? recentSearches,
  }) {
    return DashboardState(
      status: status ?? this.status,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      product: product ?? this.product,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      rating: rating ?? this.rating,
      averageRating: averageRating ?? this.averageRating,
      allProducts: allProducts ?? this.allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      selectedShipping: selectedShipping ?? this.selectedShipping,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      orderStatus: orderStatus ?? this.orderStatus,
      recentSearches: recentSearches ?? this.recentSearches,
    );
  }

  @override
  List<Object?> get props => [
    status,
    selectedShipping,
    selectedIndex,
    selectedProduct,
    rating,
    averageRating,
    filteredProducts,
    allProducts,
    product,
    selectedCategory ,
    orderStatus,
    recentSearches,
  ];
}
