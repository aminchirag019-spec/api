import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/DashboardScreen/dashboard.dart';
import 'package:api_learning/screens/discoverScreen/discover_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isAllItems = true;

  List<bool> likedList = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
       context.go(RouterName.profileScreen.path);
       return false;
      },
      child: Scaffold(
        backgroundColor:  Color(0xffF5F5F5),
        appBar: buildGemStoreAppBar("My Wishlist",drawerKey:GlobalKey(),context),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isAllItems = true);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isAllItems ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "All items",
                            style: TextStyle(
                              color:
                              isAllItems ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                     SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isAllItems = false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: !isAllItems ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Boards",
                            style: TextStyle(
                              color:
                              !isAllItems ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 20),
              Expanded(
                child: isAllItems ? _buildGrid() : _buildBoards(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/277a304a44849c4e605ccf87ec37092bf51698d0.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            likedList[index] = !likedList[index];
                          });
                        },
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: likedList[index]
                                ? const Color(0xffFF6E6E)
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 8),
               Text(
                "Women's Top",
                style: TextStyle(fontSize: 12),
              ),
               Text(
                "\$120",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              RatingBarIndicator(
                rating:3,
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: Color(0xff508A7B)),
                itemCount: 5,
                itemSize: 18,
                direction: Axis.horizontal,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoards() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children:  [
        CategoryCard(
          title: "Going out outfits",
          itemCount: "36 items",
        ),
        SizedBox(height: 24),
        CategoryCard(
          title: "Office Fashion",
          itemCount: "20+ items",
        ),
        SizedBox(height: 24),
        CategoryCard(
          title: "Office Fashion",
          itemCount: "20+ items",
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String itemCount;

  const CategoryCard({
    super.key,
    required this.title,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 170,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/board_item_1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                 SizedBox(width: 4),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/images/board_item_2.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                             SizedBox(width: 4),
                            Expanded(
                              child: Image.asset(
                                "assets/images/board_item_1.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(height: 4),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/images/board_item_2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                             SizedBox(width: 4),
                            Expanded(
                              child: Image.asset(
                                "assets/images/board_item_1.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
             Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),

         SizedBox(height: 6),

        Text(
          itemCount,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),

         SizedBox(height: 20),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }
}