import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget orderCompletedStep(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
         SizedBox(height: 30),
         Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Order Completed",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 30,),
        Column(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child:  Icon(
                Icons.shopping_bag_outlined,
                size: 50,
              ),
            ),
             SizedBox(height: 20),
             Icon(
              Icons.check_circle,
              size: 30,
              color: Colors.black,
            ),
             SizedBox(height: 30),
             Text(
              "Thank you for your purchase.\nYou can view your order in 'My Orders' section.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}