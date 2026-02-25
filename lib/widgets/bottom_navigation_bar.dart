import 'package:api_learning/globall/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  AppBottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xffC7C9D1),
          iconSize: 26,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/home_icon.png")),
              activeIcon: ImageIcon(AssetImage("assets/images/home_icon.png")),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/search_icon.png")),
              activeIcon: ImageIcon(AssetImage("assets/images/search_icon.png")),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon:  ImageIcon(AssetImage("assets/images/shop_icon.png")),
              activeIcon:ImageIcon(AssetImage("assets/images/shop_icon.png")),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/profile_icon.png")),
              activeIcon:ImageIcon(AssetImage("assets/images/profile_icon.png")),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}


