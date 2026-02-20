

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget paymentStep(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

         SizedBox(height: 10),
         Text(
          "STEP 2",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),

         SizedBox(height: 5),

        Text(
          "Payment",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),

         SizedBox(height: 25),
        Row(
          children: [
            _paymentTypeButton("Cash", false),
             SizedBox(width: 10),
            _paymentTypeButton("Credit Card", true),
             SizedBox(width: 10),
            _paymentTypeButton("...", false),
          ],
        ),

         SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              "Choose your card",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              "Add new +",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
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

         SizedBox(height: 20),

         Text(
          "or check out with",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),

         SizedBox(height: 10),

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

        SizedBox(height: 30),

        /// PRICE SECTION
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children:  [
              _priceRow("Product price", "\$110"),
              SizedBox(height: 10),
              _priceRow("Shipping", "Freeship"),
              Divider(height: 25),
              _priceRow("Subtotal", "\$110", bold: true),
            ],
          ),
        ),

         SizedBox(height: 20),
        Row(
          children:  [
            Icon(Icons.check_box, color: Colors.green, size: 20),
            SizedBox(width: 10),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "I agree to ",
                  children: [
                    TextSpan(
                      text: "Terms and conditions",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _paymentTypeButton(String title, bool selected) {
  return Expanded(
    child: Container(
      height: 55,
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!selected)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
            ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
Widget smallPaymentBox(ImageProvider image) {
  return Container(
    height: 40,
    width: 55,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Image(
      image: image,
      fit: BoxFit.contain,
    ),
  );
}
class _priceRow extends StatelessWidget {
  final String title;
  final String value;
  final bool bold;

  const _priceRow(this.title, this.value, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
