import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/models/add_to_cart.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/cartBloc/cart_bloc.dart';
import '../../Bloc/cartBloc/cart_state.dart';
import '../../models/get_products.dart';
import '../../router/router_class.dart';
import '../discoverScreen/discover_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          context.go(RouterName.dashboardScreen.path);
          return false;
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleBackButton(onTap: () =>
                        context.go(RouterName.dashboardScreen.path),),
                    SizedBox(width: 25),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Your Cart",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40,)
                  ],
                ),
                SizedBox(height: 10),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state.status == ApiStatus.loading) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (state.cart.isEmpty) {
                      return const Center(child: Text("Cart is empty"));
                    }

                    final products = state.cart
                        .expand((cartItem) => cartItem.products ?? [])
                        .toList();
                    return Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 14),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 18,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.network(
                                        product.thumbnail.toString(),
                                        height: 85,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      )
                                  ),

                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${product.title}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 22,
                                                width: 22,
                                                // decoration: BoxDecoration(
                                                //   color: item.selected
                                                //       ? const Color(0xFF2D6A4F)
                                                //       : Colors.transparent,
                                                //   borderRadius: BorderRadius.circular(6),
                                                //   border: Border.all(
                                                //     color: item.selected
                                                //         ? const Color(0xFF2D6A4F)
                                                //         : Colors.grey.shade400,
                                                //   ),
                                                // ),
                                                // child: item.selected
                                                //     ? const Icon(Icons.check,
                                                //     size: 16, color: Colors.white)
                                                //     : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "${product.price.toString()}",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Text(
                                              "Size:L | Color:Cream   ",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                height: 25,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(18),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                          18,
                                                        ),
                                                        onTap: () {},
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.remove,
                                                            size: 15,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          "1",
                                                          style: const TextStyle(
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: InkWell(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                          18,
                                                        ),
                                                        onTap: () {},
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 15,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
                Container(
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {

                        if (state.cart.isEmpty) {
                          return const SizedBox();
                        }

                        final products = state.cart
                            .expand((cartItem) => cartItem.products ?? [])
                            .toList();

                        final total = products.fold<double>(
                          0.0,
                              (sum, item) => sum + (item.total ?? 0.0),
                        );

                        return Column(
                          children: [
                            const SizedBox(height: 10),

                            _summaryRow(
                              left: "Product price",
                              right: "\$${total.toStringAsFixed(2)}",
                              leftColor: Colors.grey,
                              rightColor: Colors.black,
                            ),

                            const SizedBox(height: 20),
                            const Divider(height: 1),
                            const SizedBox(height: 15),

                            _summaryRow(
                              left: "Shipping",
                              right: "Freeship",
                              leftColor: Colors.grey,
                              rightColor: Colors.black,
                            ),

                            const SizedBox(height: 20),
                            const Divider(height: 1),
                            const SizedBox(height: 14),

                            _summaryRow(
                              left: "Subtotal",
                              right: "\$${total.toStringAsFixed(2)}",
                              leftColor: Colors.black,
                              rightColor: Colors.black,
                              isBold: true,
                              fontSize: 18,
                            ),
                          ],
                        );
                      },
                    )
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C2C2C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      context.go(RouterName.paymentCheckoutScreen.path);
                    },
                    child: const Text(
                      "Proceed to checkout",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget _summaryRow({
  required String left,
  required String right,
  required Color leftColor,
  required Color rightColor,
  bool isBold = false,
  double fontSize = 15,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        left,
        style: TextStyle(
          fontSize: fontSize,
          color: leftColor,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      Text(
        right,
        style: TextStyle(
          fontSize: fontSize,
          color: rightColor,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    ],
  );
}
