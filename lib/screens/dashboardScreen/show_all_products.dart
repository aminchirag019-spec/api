import 'package:api_learning/screens/discoverScreen/discover_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../../Bloc/DashboardBloc/dashboard_state.dart';
import '../../globall/utilities/api_url.dart';
import '../../router/router_class.dart';

class ShowAllProducts extends StatelessWidget {
  const ShowAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.dashboardScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go(RouterName.dashboardScreen.path),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xffFAFAFA),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(Icons.arrow_back_ios_new, size: 18),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: Center(
                        child: Text(
                          "All Products",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
                SizedBox(height: 10),
                BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    if (state.status == ApiStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.status == ApiStatus.failure) {
                      return const Center(child: Text("Error"));
                    }

                    if (state.filteredProducts.isEmpty) {
                      return const Center(child: Text("No products found"));
                    }
                    return Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.filteredProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.7,
                            ),
                        itemBuilder: (context, index) {
                          final product = state.filteredProducts[index];

                          return GestureDetector(
                            onTap: () {
                              final id = product.id;
                              context.go(
                                RouterName.productDetailScreen.path
                                    .replaceFirst(':id', id.toString()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.08),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 8,
                                    offset:  Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(18),
                                    ),
                                    child: Image.network(
                                      (product.images != null &&
                                              product.images!.isNotEmpty)
                                          ? product.images!.first
                                          : "https://via.placeholder.com/150",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 140,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:  TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                         SizedBox(height: 6),
                                        Text(
                                          "\$ ${product.price}",
                                          style:  TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
