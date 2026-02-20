

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget paymentStep(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 10),

        /// STEP LABEL
        const Text(
          "STEP 2",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          "Payment",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 25),

        /// PAYMENT TYPE BUTTONS
        Row(
          children: [
            _paymentTypeButton("Cash", false),
            const SizedBox(width: 10),
            _paymentTypeButton("Credit Card", true),
            const SizedBox(width: 10),
            _paymentTypeButton("...", false),
          ],
        ),

        const SizedBox(height: 25),

        /// CHOOSE CARD HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
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

        const SizedBox(height: 15),

        /// CREDIT CARD UI
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
            children: const [
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
              Text(
                "Sunie Pham",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
            _smallPaymentBox("PayPal"),
            _smallPaymentBox("Visa"),
            _smallPaymentBox("Master"),
            _smallPaymentBox("Alipay"),
            _smallPaymentBox("Amex"),
          ],
        ),

        const SizedBox(height: 30),

        /// PRICE SECTION
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: const [
              _priceRow("Product price", "\$110"),
              SizedBox(height: 10),
              _priceRow("Shipping", "Freeship"),
              Divider(height: 25),
              _priceRow("Subtotal", "\$110", bold: true),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// TERMS CHECKBOX
        Row(
          children: const [
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

Widget _smallPaymentBox(String text) {
  return Container(
    height: 40,
    width: 55,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 10),
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
