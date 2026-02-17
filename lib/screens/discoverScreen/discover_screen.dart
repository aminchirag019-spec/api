import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/DashboardBloc/dashboard_state.dart';
import 'discover_widget.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/Dashboard');
        return false;
      },
      child: Scaffold(
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
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final p = products[index];
                          final isOpen = state.selectedCategory == index;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<DashboardBloc>().add(
                                    CategoryEvent(index),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
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
                                          top: 60,
                                          left: 40,
                                          child: Text(
                                            p.banner,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
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
                                              color: Colors.white.withOpacity(
                                                0.15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: p.right,
                                          bottom: 0,
                                          top: 0,
                                          child: Image.asset(
                                            p.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (isOpen)
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 14,
                                    bottom: 22,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: ListView.separated(
                                    itemCount: p.subCategories.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (_, __) => Divider(
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.15),
                                    ),
                                    itemBuilder: (context, i) {
                                      final s = p.subCategories[i];
                                      return ListTile(
                                        title: Text(
                                          s.name,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "${s.items} Items",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.withOpacity(
                                                  0.7,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            const Icon(Icons.chevron_right),
                                          ],
                                        ),
                                        onTap: () {},
                                      );
                                    },
                                  ),
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
