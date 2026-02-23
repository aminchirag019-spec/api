import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class RateProductScreen extends StatefulWidget {
  const RateProductScreen({super.key});

  @override
  State<RateProductScreen> createState() => _RateProductScreenState();
}

class _RateProductScreenState extends State<RateProductScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.go(RouterName.orderInfo.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                     CircleBackButton(onTap: () => context.go(RouterName.orderInfo.path),),
                     SizedBox(width: 20),
                     Expanded(
                       child: Center(
                         child: Text(
                          "Rate Product",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                                             ),
                       ),
                     ),
                    SizedBox(width: 40,)
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.card_giftcard,
                              color: Colors.white, size: 18),
                          SizedBox(width: 10),
                          Text(
                            "Submit your review to get 5 points",
                            style: TextStyle(
                                color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 14)
                    ],
                  ),
                ),

                 SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: RatingBarIndicator(
                    rating: 3,
                    itemBuilder: (context, index) =>
                        Icon(Icons.star, color: Color(0xff508A7B)),
                    itemCount: 5,
                    itemSize: 50,
                    direction: Axis.horizontal,
                  ),
                ),
                 SizedBox(height: 25),

                Container(
                  height: 250,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child:  TextField(
                    maxLength: 50,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                      "Would you like to write anything about this product?",
                      counterText: "",
                    ),
                  ),
                ),

      //               SizedBox(height: 20),
                Spacer(),
                Row(
                  children: [
                    _uploadBox(Icons.image_outlined),
                     SizedBox(width: 20),
                    _uploadBox(Icons.camera_alt_outlined),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child:  Text("Submit Review",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _uploadBox(IconData icon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade400,
          style: BorderStyle.solid,
        ),
      ),
      child: Icon(icon, color: Colors.grey.shade600),
    );
  }
}