import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.orderScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleBackButton(
                      onTap: () => context.go(RouterName.orderScreen.path),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Order #1514",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 44,)
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your order is delivered",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Rate product to get 5 points for collect.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      ImageIcon(
                        AssetImage("assets/images/delievery_bag.png"),
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                infoCard(),
                SizedBox(height: 20),
                priceCard(),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Return home"),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          context.go(RouterName.rateProduct.path);
                        },
                        child: Text(
                          "Rate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          infoRow("Order number", "#1514"),
          SizedBox(height: 12),
          infoRow("Tracking Number", "IK987362341"),
          SizedBox(height: 12),
          infoRow("Delivery address", "SBI Building, Software Park"),
        ],
      ),
    );
  }

  Widget priceCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          productRow("Maxi Dress", "x1", "\$68.00"),
          SizedBox(height: 10),
          productRow("Linen Dress", "x1", "\$52.00"),
          SizedBox(height: 20),
          infoRow("Sub Total", "120.00"),
          SizedBox(height: 8),
          infoRow("Shipping", "0.00"),
          Divider(height: 30),
          infoRow("Total", "\$120.00", isBold: true),
        ],
      ),
    );
  }
}

class infoRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;

  const infoRow(this.title, this.value, {this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class productRow extends StatelessWidget {
  final String name;
  final String qty;
  final String price;

  const productRow(this.name, this.qty, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name)),
        Text(qty),
        const SizedBox(width: 20),
        Text(price),
      ],
    );
  }
}
