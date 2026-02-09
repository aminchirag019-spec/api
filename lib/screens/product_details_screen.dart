import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../Bloc/DashboardBloc/dashboard_event.dart';
import '../Bloc/DashboardBloc/dashboard_state.dart';
import '../data/api_client.dart';
import '../data/repository.dart';
import '../globall/utilities.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashboardBloc(AuthRepository(ApiClient()))
            ..add(GetProductDetails(id)),
      child: WillPopScope(
        onWillPop: () async {
          context.go('/Dashboard');
          return false;
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Product Details")),
          body: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state.status == ApiStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == ApiStatus.failure) {
                return const Center(child: Text("Error"));
              }

              final product = state.selectedProduct;
              if (product == null) return const SizedBox();

              final imageUrl =
                  product.thumbnail ??
                  (product.images != null && product.images!.isNotEmpty
                      ? product.images!.first
                      : "");

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.title ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(product.description ?? ""),
                    const SizedBox(height: 12),
                    Text("Price: ₹${product.price}"),
                    Text("Rating: ${product.rating}"),
                    Text("Stock: ${product.stock}"),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
