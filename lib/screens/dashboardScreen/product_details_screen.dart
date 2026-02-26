import 'package:api_learning/Bloc/cartBloc/cart_bloc.dart';
import 'package:api_learning/Bloc/cartBloc/cart_event.dart';
import 'package:api_learning/models/get_products.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import '../../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../../Bloc/DashboardBloc/dashboard_event.dart';
import '../../Bloc/DashboardBloc/dashboard_state.dart';
import '../../Bloc/cartBloc/cart_state.dart';
import '../../data/api_client.dart';
import '../../data/repository.dart';
import '../../globall/utilities/api_url.dart';
import '../../globall/utilities/colors.dart';
import '../discoverScreen/discover_widget.dart';

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

  final ValueNotifier<bool> isFav = ValueNotifier(false);
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
              final double avgRating = (product.rating ?? 0).toDouble();
              final int totalReviews = (product.reviews?.length ?? 0);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleBackButton(
                                  onTap: () => context.go(
                                    RouterName.dashboardScreen.path,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ValueListenableBuilder<bool>(
                                      valueListenable: isFav,
                                      builder: (context, value, child) {
                                        return IconButton(
                                          onPressed: () {
                                            isFav.value = !isFav.value;
                                          },
                                          icon: Icon(
                                            value
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: value
                                                ? Color(0xFFFF6B6B)
                                                : Colors.grey,
                                            size: 15,
                                          ),
                                        );
                                      },
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
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(18),
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
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.contain,
                              ),
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
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: avgRating,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: Color(0xff508A7B)),
                            itemCount: 5,
                            itemSize: 22,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(width: 10),
                          Text("(${totalReviews.toString()})"),
                        ],
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
                          context.go(RouterName.paymentCheckoutScreen.path);
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
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${avgRating.toStringAsFixed(1)}",
                                  style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("OUT OF 5"),
                                SizedBox(width: 70),
                                Column(
                                  children: [
                                    RatingBarIndicator(
                                      rating: avgRating,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Color(0xff508A7B),
                                      ),
                                      itemCount: 5,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                    ),
                                    Text("${totalReviews.toString()} Ratings"),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 18),
                            Column(
                              children: List.generate(5, (index) {
                                final star = 5 - index;
                                double percent;
                                if (avgRating >= star) {
                                  percent = 1;
                                } else if (avgRating < star - 1) {
                                  percent = 0.1;
                                } else {
                                  percent = 0.6;
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "$star ☆",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: LinearProgressIndicator(
                                            value: percent,
                                            minHeight: 8,
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            valueColor:
                                                const AlwaysStoppedAnimation(
                                                  Color(0xff508A7B),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
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
        ),
        bottomNavigationBar: BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if(state.status == ApiStatus.success){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart"),));
            }
          },
          child: Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                context.read<CartBloc>().add(AddToCartEvent(
                  productId: widget.id,
                  quantity:1
                ));
                context.go(RouterName.cartScreen.path);
                print("added");
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(),
                backgroundColor: Color(0xff343434),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag, size: 30, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Add To Cart", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}