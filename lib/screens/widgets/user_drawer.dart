import 'package:api_learning/router/router_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/Authbloc/auth_bloc.dart';
import '../../Bloc/Authbloc/auth_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 250,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final imageUrl = state.loginModel?.image;
          final firstName = state.loginModel?.firstName;
          final lastName = state.loginModel?.lastName;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage:
                        (imageUrl != null && imageUrl.isNotEmpty)
                            ? NetworkImage(imageUrl)
                            : null,
                        child: (imageUrl == null || imageUrl.isEmpty)
                            ? Icon(Icons.person, color: Colors.grey)
                            : null,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             firstName ?? "token Expired",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                             SizedBox(height: 2),
                             Text(
                              lastName ?? "token expired",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:  Icon(Icons.notifications_none_rounded),
                      )
                    ],
                  ),

                   SizedBox(height: 20),

                  // ---------------- MAIN MENU ----------------
                  _DrawerTile(
                    title: "Homepage",
                    icon: Icons.home_outlined,
                    isSelected: true,
                    onTap: () {
                      context.go(RouterName.dashboardScreen.path);
                    },
                  ),

                  _DrawerTile(
                    title: "Discover",
                    icon: Icons.search_rounded,
                    onTap: () {
                      context.go(RouterName.discoverScreen.path);
                    },
                  ),

                  _DrawerTile(
                    title: "My Order",
                    icon: Icons.shopping_bag_outlined,
                    onTap: () {
                      context.go(RouterName.orderScreen.path);
                    },
                  ),

                  _DrawerTile(
                    title: "My profile",
                    icon: Icons.person_outline,
                    onTap: () {
                      context.go(RouterName.profileScreen.path);
                    },
                  ),

                   SizedBox(height: 18),
                   Text(
                    "OTHER",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),

                   SizedBox(height: 10),

                  _DrawerTile(
                    title: "Setting",
                    icon: Icons.settings_outlined,
                    onTap: () {},
                  ),

                  _DrawerTile(
                    title: "Support",
                    icon: Icons.mail_outline_rounded,
                    onTap: () {},
                  ),

                  _DrawerTile(
                    title: "About us",
                    icon: Icons.info_outline_rounded,
                    onTap: () {},
                  ),
                   Spacer(),
                   _ThemeToggle(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF2F2F2) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.black : Colors.grey[700],
            ),
             SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.black : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _ThemeToggle extends StatefulWidget {
  const _ThemeToggle();

  @override
  State<_ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<_ThemeToggle> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                setState(() => isLight = true);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isLight ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wb_sunny_outlined, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      "Light",
                      style: TextStyle(
                        fontWeight:
                        isLight ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                setState(() => isLight = false);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isLight ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Icon(Icons.nights_stay_outlined, size: 18),
                     SizedBox(width: 6),
                    Text(
                      "Dark",
                      style: TextStyle(
                        fontWeight:
                        !isLight ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
