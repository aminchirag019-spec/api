import 'package:api_learning/Bloc/Authbloc/auth_event.dart';
import 'package:api_learning/Bloc/ProfileBloc/profile_state.dart';
import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/Authbloc/auth_bloc.dart';
import '../../Bloc/Authbloc/auth_state.dart';
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
              Center(child: CircularProgressIndicator());
            }
            final profile = snapshot.data;
            return SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20),
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
                            child: Image.network(profile?.image ?? "")
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile?.firstName ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                profile?.lastName ?? "",
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
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                                AssetImage("assets/images/Setting.png")),
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
                            image: AssetImage("assets/images/Location.png"),
                            title: "Address",
                            onTap: () {
                              context.go(RouterName.addressScreen.path);
                            },
                          ),
                          profileTile(
                            image: AssetImage("assets/images/Wallet.png"),
                            title: "Payment method",
                            onTap: () {
                              context.go(RouterName.cardManagementScreen.path);
                            },
                          ),
                          profileTile(
                            image: AssetImage("assets/images/Ticket.png"),
                            title: "Voucher",
                            onTap: () {
                              context.go(RouterName.voucherScreen.path);
                            },
                          ),
                          profileTile(
                            image: AssetImage("assets/images/heart.png"),
                            title: "My Wishlist",
                            onTap: () {
                              context.go(RouterName.wishlistScreen.path);
                            },
                          ),
                          profileTile(
                            image: AssetImage("assets/images/Star_icon.png"),
                            title: "Rate this app",
                            onTap: () {
                              context.go(RouterName.rateProduct.path);
                            },
                          ),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return profileTile(
                                image: AssetImage("assets/images/Logout.png"),
                                title: "Log out",
                                onTap: ()async {
                                  context.read<AuthBloc>().add(Logout());
                                  print("Logout");
                                  context.go(RouterName.loginScreen.path);
                                },
                              );
                            },
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
  required ImageProvider image,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    onTap: onTap,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    leading: ImageIcon(
      image,
      color: Colors.grey.shade600,
      size: 22,
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      size: 16,
      color: Colors.grey,
    ),
  );
}
