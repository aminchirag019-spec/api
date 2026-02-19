import 'dart:math';

import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:api_learning/screens/widgets/filter_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_class.dart';
import 'discover_widget.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.go(RouterName.dashboardScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        endDrawer: FilterDrawer(),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => context.go(RouterName.dashboardScreen.path),
                        child: Container(
                          height: 40,
                          width: 40,
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
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(Icons.arrow_back_ios_new, size: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                              controller: textController,
                              focusNode: focusNode,
                              maxLines: 1,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                hintText: "Search..",
                                prefixIcon: const Icon(Icons.search),
                                filled: true,
                                fillColor: const Color(0xffFAFAFA),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onFieldSubmitted: (value) {
                                context.read<DashboardBloc>().add(RecentText(value));
                                focusNode.unfocus();
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              print("Drawer Button Presses---------------------------------------------------");
                              _scaffoldKey.currentState?.openEndDrawer();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xffFAFAFA),
                              ),
                              child: Image.asset("assets/images/filter.png"),
                            ),
                          ),
                        ],
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                        child: state.recentSearches.isEmpty
                            ? const SizedBox(height: 0) // no gap
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(height: 20),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Recent Searches",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF33302E40),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                  //   context.read<DashboardBloc>().add(
                                  //     ClearRecentSearches(),
                                  //   );
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    size: 18,
                                    color: Color(0xFF33302E40),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: List.generate(
                                state.recentSearches.length,
                                    (index) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFAFAFA),
                                      borderRadius:
                                      BorderRadius.circular(18),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(state.recentSearches[index]),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular this week",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.go(RouterName.showAllDresses.path);
                            },
                            child: Text(
                              "Show all",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      Expanded(
                        child: GridView.builder(
                          itemCount: 2,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                            childAspectRatio: 0.58,
                          ),
                          itemBuilder: (context, index) {
                             final item = itemModel[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(image: AssetImage(item.image),
                                    fit: BoxFit.cover
                                    )
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(item.title),
                                Text(item.price,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700
                                ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ),
    );
  }
}

