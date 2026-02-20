import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: WillPopScope(
        onWillPop: () async{
          context.go(RouterName.profileScreen.path);
          return false;
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleBackButton(onTap: () => context.go(RouterName.profileScreen.path),),
                     Expanded(
                      child: Center(
                        child: Text(
                          "Voucher",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(width: 36),
                  ],
                ),

                const SizedBox(height: 25),

                /// 🎟 Voucher List
                _voucherCard(
                  percent: "50%",
                  title: "Black Friday",
                  subtitle: "Sale off 50%",
                  code: "fridaysale",
                  expDate: "20 Dec",
                  dark: true,
                ),

                const SizedBox(height: 15),

                _voucherCard(
                  percent: "30%",
                  title: "Holiday Sale",
                  subtitle: "Sale off 30%",
                  code: "holiday30",
                  expDate: "22 Dec",
                ),

                const SizedBox(height: 15),

                _voucherCard(
                  percent: "20%",
                  title: "First order",
                  subtitle: "20% off your first order",
                  code: "welcome",
                  expDate: "28 Dec",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _voucherCard({
    required String percent,
    required String title,
    required String subtitle,
    required String code,
    required String expDate,
    bool dark = false,
  }) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset:  Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: dark ? Colors.black87 : Colors.grey.shade400,
              borderRadius:  BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              percent,
              style:  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:  TextStyle(
                          fontWeight: FontWeight.w600)),
                   SizedBox(height: 4),
                  Text(
                    subtitle,
                    style:  TextStyle(
                        fontSize: 12, color: Colors.grey),
                  ),
                   SizedBox(height: 4),
                  Text(
                    "Code: $code",
                    style:  TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Exp.",
                    style: TextStyle(
                        fontSize: 11, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(
                  expDate,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}