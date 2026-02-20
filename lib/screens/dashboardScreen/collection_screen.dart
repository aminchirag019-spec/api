import 'package:api_learning/router/router_class.dart';
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
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/slider_image.png"),
                Positioned(child: Expanded(child: Container(
                  color: Colors.black,
                )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
