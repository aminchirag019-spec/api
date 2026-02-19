import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_class.dart';

class MyOrdersBlocUi extends StatelessWidget {
  const MyOrdersBlocUi({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.go(RouterName.dashboardScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(AssetImage("assets/images/drawer.png")),
                    ),
                    Text(
                      "My Orders",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage("assets/images/notification.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  final tabs = ["Pending", "Delivered", "Cancelled"];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        children: List.generate(3, (index) {
                          final isSelected = state.orderStatus == index;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<DashboardBloc>().add(
                                  OrderStatus(index),
                                );
                              },
                              child: Center(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xff3D4045)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Text(
                                    tabs[index],
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 14),
              Expanded(
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    final statusText = state.orderStatus == 0
                        ? "PENDING"
                        : state.orderStatus == 1
                        ? "DELIVERED"
                        : "CANCELED";
                    final statusColor = state.orderStatus == 0
                        ? Color(0xffFF7A00)
                        : state.orderStatus == 1
                        ? Color(0xff00A67E)
                        : Color(0xffFF2D2D);

                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Order #${1524 + index}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "13/05/2021",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 12),

                              Row(
                                children: [
                                  Text(
                                    "Tracking number:",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "IK287368838",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Text(
                                    "Quantity:",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Subtotal:",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "\$110",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    statusText,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: statusColor,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 34,
                                    width: 95,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1.2,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22),
                                        ),
                                      ),
                                      child: Text(
                                        "Details",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
    );
  }
}
