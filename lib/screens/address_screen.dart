import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/DashboardScreen/dashboard.dart';
import 'package:api_learning/screens/DashboardScreen/dashboard.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Bloc/DashboardBloc/dashboard_bloc.dart';
import '../Bloc/DashboardBloc/dashboard_state.dart';

class DeliveryAddressScreen extends StatelessWidget {
  const DeliveryAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.go(RouterName.profileScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleBackButton(onTap: () =>  context.go(RouterName.profileScreen.path),),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Delivery address",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 36),
                  ],
                ),

                SizedBox(height: 25),
                _addressCard(
                  index: 0,
                  icon: Icons.apartment,
                  title: "My Office",
                  subtitle: "SB Building, street 5, Software Park",
                ),
                SizedBox(height: 15),
                _addressCard(
                  index: 1,
                  icon: Icons.home,
                  title: "My Home",
                  subtitle: "SB Building, street 5, Software Park",
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding:
                      const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child:  Text("Add new address",style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addressCard({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final bool isSelected = state.selectedIndex == index;
        return GestureDetector(
          onTap: () {
            context.read<DashboardBloc>().add(Selection(index));
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected
                      ? Colors.black
                      : Colors.grey,
                ),
                SizedBox(width: 12),
                Icon(icon, color: Colors.grey.shade700),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SEND TO",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Edit",
                  style: TextStyle(
                      color: Colors.red, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}