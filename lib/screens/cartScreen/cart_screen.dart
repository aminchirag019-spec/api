import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_class.dart';

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
                    Center(
                      child: Text(
                        "Your Cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
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
                                child: Image.asset(
                                  "assets/images/cart_image_2.jpg",
                                  height: 85,
                                  width: 70,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (_, __, ___) {
                                    return Container(
                                      height: 70,
                                      width: 70,
                                      alignment: Alignment.center,
                                      color: Colors.grey[200],
                                      child: const Icon(
                                        Icons.image_not_supported_outlined,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "SportsWear Set",
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
                                      "\$ 80.00",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    SizedBox(height: 6),

                                    Row(
                                      children: [
                                        Text(
                                          "Size: L | Color:Cream   ",
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
                                              borderRadius: BorderRadius.circular(
                                                18,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(18),
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
                                                        BorderRadius.circular(18),
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
                ),
                Container(
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        _summaryRow(
                          left: "Product price",
                          right: "\$${20.00}",
                          leftColor: Colors.grey,
                          rightColor: Colors.black,
                        ),
                        SizedBox(height: 20),
                        const Divider(height: 1),
                        SizedBox(height: 15),
                        _summaryRow(
                          left: "Shipping",
                          right: "Freeship",
                          leftColor: Colors.grey,
                          rightColor: Colors.black,
                        ),
                         SizedBox(height: 20),
                         Divider(height: 1),
                        const SizedBox(height: 14),
                        _summaryRow(
                          left: "Subtotal",
                          right: "\$${20.00}",
                          leftColor: Colors.black,
                          rightColor: Colors.black,
                          isBold: true,
                          fontSize: 18,
                        ),
                      ],
                    ),
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
