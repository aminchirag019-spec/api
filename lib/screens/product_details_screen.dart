import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import '../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../Bloc/DashboardBloc/dashboard_event.dart';
import '../Bloc/DashboardBloc/dashboard_state.dart';
import '../data/api_client.dart';
import '../data/repository.dart';
import '../globall/utilities.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashboardBloc>().add(GetProductDetails(widget.id));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/Dashboard');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state.status == ApiStatus.loading) {
                return Center(child: CircularProgressIndicator());
              }
          
              if (state.status == ApiStatus.failure) {
                return Center(child: Text("Error"));
              }
          
              final product = state.selectedProduct;
              if (product == null) return const SizedBox();
              final imageUrl =
                  product.thumbnail ??
                  (product.images != null && product.images!.isNotEmpty
                      ? product.images!.first
                      : "");
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.go('/Dashboard');
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.12),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.arrow_back_ios_new, size: 20),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.go('/Dashboard');
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.12),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: Icon(Icons.heart_broken_sharp, size: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.08),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 10,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.network(imageUrl, fit: BoxFit.contain),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Text(
                      product.title ?? "",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "₹ ${product.price}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.description ?? "",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 22),
                    Text(
                      "Top Review",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        context.go('/PaymentCheckoutScreen');
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ),
                        child: Text(
                          product.reviews?.isNotEmpty == true
                              ? (product.reviews!.first.comment ?? "")
                              : "No reviews yet",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
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
