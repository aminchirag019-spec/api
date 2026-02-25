import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/discoverScreen/discover_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import '../../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../../Bloc/DashboardBloc/dashboard_event.dart';
import '../../Bloc/DashboardBloc/dashboard_state.dart';
import '../../data/api_client.dart';
import '../../data/repository.dart';
import '../../globall/utilities/api_url.dart';
import '../paymentScreens/shipping_screen.dart';

class DummyProductDetails extends StatefulWidget {
   DummyProductDetails({super.key, required this.item});
  final ItemModel item;
  @override
  State<DummyProductDetails> createState() => _DummyProductDetailsState();
}

class _DummyProductDetailsState extends State<DummyProductDetails> {
  final ValueNotifier<bool> isFav = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.showAllDresses.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state.status == ApiStatus.loading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.status == ApiStatus.failure) {
                return Center(child: Text("Error"));
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleBackButton(onTap: () => context.go(RouterName.showAllDresses.path),),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ValueListenableBuilder<bool>(
                                      valueListenable: isFav,
                                      builder: (context, value, child) {
                                        return IconButton(
                                          onPressed: () {
                                            isFav.value = !isFav.value;
                                          },
                                          icon: Icon(
                                            value ? Icons.favorite : Icons.favorite_border,
                                            color: value ?  Color(0xFFFF6B6B) : Colors.grey,
                                            size: 15,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.08),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              widget.item.image,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18),
                    Text(
                     widget.item.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.item.price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: widget.item.rating ?? 0.0,
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Color(0xff508A7B)),
                          itemCount: 5,
                          itemSize: 22,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(width: 10,),
                       Text("(${widget.item.totalReview})")
                      ],
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("This elegant evening dress is designed to make a statement. Crafted from premium-quality fabric, it features a flattering silhouette that enhances your natural curves. The soft, flowing material ensures comfort while the refined detailing adds a touch of sophistication. Perfect for parties, weddings, and special occasions.")
                   , SizedBox(height: 22),
                    Text(
                      "Top Review",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        context.go(RouterName.paymentCheckoutScreen.path);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.item.rating ?? 0.0.toStringAsFixed(1)}",
                                style:  TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text("OUT OF 5"),
                              SizedBox(width: 9),
                              Column(
                                children: [
                                  RatingBarIndicator(
                                    rating: widget.item.rating ?? 0.0,
                                    itemBuilder: (context, index) =>
                                        Icon(Icons.star, color: Color(0xff508A7B)),
                                    itemCount: 5,
                                    itemSize: 20,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 18),
                          Column(
                            children: List.generate(5, (index) {
                              final star = 5 - index;
                              double percent;
                              if (widget.item.rating!>= star) {
                                percent = 1;
                              } else if (widget.item.rating!< star - 1) {
                                percent = 0.1;
                              } else {
                                percent = 0.6;
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "$star ☆",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        child: LinearProgressIndicator(
                                          value: percent,
                                          minHeight: 8,
                                          backgroundColor:
                                          Colors.grey.shade300,
                                          valueColor:
                                          const AlwaysStoppedAnimation(
                                            Color(0xff508A7B),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          child: ElevatedButton(onPressed: () {
            context.go(RouterName.cartScreen.path);
          },style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Color(0xff343434)
          ),child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag,size: 30,color: Colors.white,),
              SizedBox(width: 10,),
              Text("Add To Cart",style: TextStyle(color: Colors.white),)
            ],
          ),)),
        ),
      ),
    );
  }
}

