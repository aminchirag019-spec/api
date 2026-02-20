import 'package:api_learning/screens/discoverScreen/discover_widget.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isAllItems = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.menu),
                    Text(
                      "My Wishlist",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.notifications_none),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isAllItems = true;
                          });
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
                              color: isAllItems ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isAllItems = false;
                          });
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
                              color: !isAllItems ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),  
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(child: isAllItems ? _buildGrid() : _buildBoards()),
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
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final item = itemModel[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(item.image),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(item.title, style: TextStyle(fontSize: 12)),
              Text(item.price, style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoards() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _boardItem("Going out outfits", "36 items"),
        SizedBox(height: 20),
        _boardItem("Office Fashion", "20 items"),
      ],
    );
  }

  Widget _boardItem(String title, String count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: Row(
            children: List.generate(4, (index) {
              final item = itemModel[index];
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
            Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
        Text(count, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
