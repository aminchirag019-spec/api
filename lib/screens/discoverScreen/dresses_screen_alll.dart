import 'package:api_learning/screens/discoverScreen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../../Bloc/DashboardBloc/dashboard_state.dart';
import '../../router/router_class.dart';
import 'discover_widget.dart';

class DressesScreenAlll extends StatelessWidget {
  const DressesScreenAlll({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.searchScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go(RouterName.dashboardScreen.path),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xffFAFAFA),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(Icons.arrow_back_ios_new, size: 18),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "Dresses",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Found\n${itemModel.length} Results",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text("Filter", style: TextStyle(fontSize: 12)),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_downward_rounded, size: 15),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: itemModel.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.58,
                        ),
                        itemBuilder: (context, index) {
                          final item = itemModel[index];
                          print(item.rating);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {

                                  }
                                  ,child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(18),
                                        image: DecorationImage(
                                            image: AssetImage(item.image),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(item.title),
                              Text(item.price),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 3,
                                    itemBuilder: (context, index) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    itemCount: 5,
                                    itemSize: 15,
                                    direction: Axis.horizontal,
                                  ),
                                  Text("(${item.rating?.toInt()})")
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
