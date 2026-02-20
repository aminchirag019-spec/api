import 'package:api_learning/Bloc/ProfileBloc/profile_state.dart';
import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/models.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = AuthRepository(ApiClient());
    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.dashboardScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<ProfileModel>(
          future: repo.profile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            final profile = snapshot.data!;
            return SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF3D6D6),
                          ),
                          child: Image.network(profile.image ?? "")
                        ),
                         SizedBox(width: 14),
                         Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.firstName ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                profile.lastName ?? "",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          profileTile(
                            icon: Icons.location_on_outlined,
                            title: "Address",
                            onTap: () {
                              context.go(RouterName.addressScreen.path);
                            },
                          ),
                          profileTile(
                            icon: Icons.credit_card,
                            title: "Payment method",
                            onTap: () {
                              context.go(RouterName.cardManagementScreen.path);
                            },
                          ),
                          profileTile(
                            icon: Icons.card_giftcard,
                            title: "Voucher",
                            onTap: () {
                              context.go(RouterName.voucherScreen.path);
                            },
                          ),
                          profileTile(
                            icon: Icons.favorite_border,
                            title: "My Wishlist",
                            onTap: () {
                              context.go(RouterName.wishlistScreen.path);
                            },
                          ),
                          profileTile(
                            icon: Icons.star_border,
                            title: "Rate this app",
                            onTap: () {},
                          ),
                          profileTile(
                            icon: Icons.logout,
                            title: "Log out",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


Widget profileTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.grey.shade500),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
      ),
    ],
  );
}
