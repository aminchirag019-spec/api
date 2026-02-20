
import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/cartScreen/cart_screen.dart';
import 'package:api_learning/screens/dashboardScreen/show_all_products.dart';
import 'package:api_learning/screens/discoverScreen/discover_screen.dart';
import 'package:api_learning/screens/discoverScreen/discover_widget.dart';
import 'package:api_learning/screens/discoverScreen/search_screen.dart';
import 'package:api_learning/screens/AuthScreens/intro_screen.dart';
import 'package:api_learning/screens/orderScreens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../Bloc/Authbloc/auth_bloc.dart';
import '../globall/utilities.dart';
import '../screens/AuthScreens/forgot_pass_screen.dart';
import '../screens/AuthScreens/login_screen.dart';
import '../screens/AuthScreens/otp_screen.dart';
import '../screens/AuthScreens/profile_screen.dart';
import '../screens/AuthScreens/signup_screen.dart';
import '../screens/AuthScreens/splash_screen.dart';
import '../screens/DashboardScreen/dashboard.dart';
import '../screens/discoverScreen/dresses_screen_alll.dart';
import '../screens/discoverScreen/dummy_product _details.dart';
import '../screens/my_wishlist_page.dart';
import '../screens/notification_screen.dart';
import '../screens/paymentScreens/payment_main_screen.dart';
import '../screens/dashboardScreen/product_details_screen.dart';
import '../screens/setting_screen.dart';
import '../widgets/bottom_navigation_bar.dart';


final GoRouter approuter = GoRouter(
  initialLocation: RouterName.splashScreen.path,
  routes: [
    GoRoute(
      path: RouterName.splashScreen.path,
      builder: (context, state) =>  SplashScreen(),
    ),
    GoRoute(
      path: RouterName.loginScreen.path,
      builder: (context, state) => LoginScreen(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppBottomNavBar(navigationShell: navigationShell);
        },
        branches:[
          StatefulShellBranch(routes: [
            GoRoute(
              path: RouterName.dashboardScreen.path,
              pageBuilder: (context, state) => MaterialPage(child: Dashboard()),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: RouterName.searchScreen.path,
              pageBuilder: (context, state) => MaterialPage(child: SearchScreen()),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: RouterName.orderScreen.path,
              pageBuilder: (context, state) => MaterialPage(child: MyOrdersBlocUi())
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: RouterName.profileScreen.path,
              pageBuilder: (context, state) =>  MaterialPage(child: ProfileScreen()),
            ),
          ])
        ]),
    GoRoute(
      path: RouterName.productDetailScreen.path,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ProductDetailsScreen(id: id);
      },
    ),
    GoRoute(path: RouterName.onBoardingScreen.path,
    builder: (context, state) => OnboardingCarouselScreen(),
    ),
    GoRoute(path: RouterName.otpScreen.path,
    builder: (context, state) => OtpScreen(),
    ),
    GoRoute(path: RouterName.signupScreen.path,
    builder: (context, state) => SignupScreen(),
    ),
    GoRoute(path: RouterName.paymentCheckoutScreen.path,
    builder: (context, state) => CheckoutScreen(),
    ),
    GoRoute(path: RouterName.forgotPassScreen.path,
    builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(path: RouterName.discoverScreen.path,
    builder: (context, state) => DiscoverScreen(),
    ),
    GoRoute(path: RouterName.showAllDresses.path,
    builder: (context, state) => DressesScreenAlll(),
    ),
    GoRoute(path: RouterName.cartScreen.path,
    builder: (context, state) => CartScreen(),
    ),
    GoRoute(path: RouterName.showAllProducts.path,
    builder: (context, state) => ShowAllProducts(),
    ),
    GoRoute(path: RouterName.manualProductDetail.path,
    builder: (context, state) {
      final item = state.extra as ItemModel;
      return DummyProductDetails(item : item);
    },
    ),
    GoRoute(path: RouterName.settingScreen.path,
    builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(path: RouterName.notificationScreen.path,
    builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(path: RouterName.wishlistScreen.path,
    builder: (context, state) => WishlistScreen(),
    )

  ],
);
