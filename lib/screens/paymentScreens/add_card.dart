import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                     CircleBackButton(onTap: () => context.go(RouterName.cardManagementScreen.path),),
                       SizedBox(width: 75),
                       Text(
                        "Add new card",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),  
                   SizedBox(height: 25),
                  _cardPreview(),
                   SizedBox(height: 30),
                  _inputField("Cardholder Name", "Sunie Pham"),
                   SizedBox(height: 20),
                  _inputField("Card Number", "5412363272837284"),
                   SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _inputField("Expires", "03/23")),
                       SizedBox(width: 16),
                      Expanded(child: _inputField("CVV", "999")),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child:  Text("Add card",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ),

                   SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 💳 CARD UI
  Widget _cardPreview() {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFF2994A), Color(0xFFF2C94C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Mastercard Logo (Simple Version)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: const Offset(-10, 0),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            "****  ****  ****  ****",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CARDHOLDER NAME",
                      style: TextStyle(
                          color: Colors.white70, fontSize: 10)),
                  SizedBox(height: 4),
                  Text("NAME",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("VALID THRU",
                      style: TextStyle(
                          color: Colors.white70, fontSize: 10)),
                  SizedBox(height: 4),
                  Text("MM/YY",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget _inputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Colors.grey.shade600, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}