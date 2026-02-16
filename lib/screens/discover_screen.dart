import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(AssetImage("assets/images/drawer.png")),
                    Text(
                      "Discover",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ImageIcon(AssetImage("assets/images/notification.png")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search..",
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Color(0xffFAFAFA),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffFAFAFA),
                      ),
                      child: Image.asset("assets/images/filter.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final p = products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: p.backgroundColor,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 25,
                              right: -30,
                              child: Container(
                                height: 100,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: p.boxColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              right: -70,
                              top: 0,
                              left: 80,
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                            ),
                            Positioned(
                              right: p.right,
                              bottom: 0,
                              top: 0,
                              child: Image.asset(p.image, fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Products {
  final String image;
  final Color boxColor;
  final Color backgroundColor;
  final double? right;
  final double? left;
  final double? bottom;
  final double? top;

  Products({
    required this.image,
    required this.boxColor,
    required this.backgroundColor,
    this.right,
    this.left,
    this.bottom,
    this.top,
  });
}

List<Products> products = [
  Products(
    image: "assets/images/promotional_image.png",
    backgroundColor: Color(0xffA3A798),
    boxColor: Color(0xffC2C7B5),
    right: -70,
  ),
  Products(
    image: "assets/images/promo_banner.png",
    backgroundColor: Color(0xff898280),
    boxColor: Color(0xff9C9492),
    right: -30,
  ),
  Products(
    image: "assets/images/promo_banner_3.png",
    backgroundColor: Color(0xff44565C),
    boxColor: Color(0xff5B7178),
    right: -40,
  ),
  Products(image: "assets/images/promo_banner_4.png",
      boxColor: Color(0xffB9AEB2),
      backgroundColor: Color(0xffD1CACD),
    right: 30
  ),
];
