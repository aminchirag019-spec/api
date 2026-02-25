import 'package:api_learning/screens/paymentScreens/add_card.dart';
import 'package:api_learning/screens/paymentScreens/payment_checkout_screen.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_class.dart';


class CardManagementScreen extends StatelessWidget {
  const CardManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () async{
            context.go(RouterName.cardManagementScreen.path);
            return false;
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleBackButton(onTap: () => context.go(RouterName.profileScreen.path),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          "Card Management",
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                          context.go(RouterName.newCard.path);
                          },
                          child: Text(
                            "Add new +",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                   SizedBox(height: 15),
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff2DB6F5), Color(0xff0AA1DD)],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "VISA",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "4364 1345 8932 8378",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("CARDHOLDER NAME",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Text(
                              "Sunie Pham",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(child: Image.asset("assets/images/card_background.png"))
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// PAYMENT LOGOS ROW
                  const Text(
                    "or check out with",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallPaymentBox(AssetImage("assets/images/PayPal.png")),
                      smallPaymentBox(AssetImage("assets/images/visa-logo.png")),
                      smallPaymentBox(AssetImage("assets/images/Method=Mastercard.png")),
                      smallPaymentBox(AssetImage("assets/images/Alipay.png")),
                      smallPaymentBox(AssetImage("assets/images/amex_method.png")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
