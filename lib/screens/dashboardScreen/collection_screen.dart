import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/discoverScreen/discover_widget.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.go(RouterName.dashboardScreen.path);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/images/slider_image.png",
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleBackButton(onTap: () => context.go(RouterName.dashboardScreen.path),),
                       Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Autumn\nCollection\n2021",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Image(image: AssetImage("assets/images/277a304a44849c4e605ccf87ec37092bf51698d0.png")),
                          SizedBox(height: 15,),
                          Image(image: AssetImage("assets/images/277a304a44849c4e605ccf87ec37092bf51698d0.png")),
                        ],
                      )),
                      SizedBox(width: 8,),
                      Expanded(child: Column(
                        children: [
                          Image(image: AssetImage("assets/images/277a304a44849c4e605ccf87ec37092bf51698d0.png"),height: 220,),
                          SizedBox(height: 12,),
                          Image(image: AssetImage("assets/images/277a304a44849c4e605ccf87ec37092bf51698d0.png"),height: 220,),
                          SizedBox(height: 15,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 180,
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  context.go(RouterName.collectionAllScreen.path);
                                },
                                child:  Text(
                                  "VIEW ALL",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}