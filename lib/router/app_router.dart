
import 'package:api_learning/screens/discoverScreen/discover_screen.dart';
import 'package:api_learning/screens/discoverScreen/search_screen.dart';
import 'package:api_learning/screens/intro_screen.dart';
import 'package:api_learning/screens/orderScreens/order_screen.dart';
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
import '../screens/paymentScreens/payment_checkout_screen.dart';
import '../screens/product_details_screen.dart';


final GoRouter approuter = GoRouter(
  initialLocation: '/SplashScreen',
  routes: [
    GoRoute(
      path: '/SplashScreen',
      builder: (context, state) =>  SplashScreen(),
    ),
    GoRoute(
      path: '/LoginScreen',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/Dashboard',
      builder: (context, state) =>  Dashboard(),
    ),
    GoRoute(
      path: '/ProfileScreen',
      builder: (context, state) =>  ProfileScreen(),
    ),
    GoRoute(
      path: '/ProductDetails/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ProductDetailsScreen(id: id);
      },
    ),
    GoRoute(path: '/IntroOnboarding',
    builder: (context, state) => OnboardingCarouselScreen(),
    ),
    GoRoute(path: '/OtpScreen',
    builder: (context, state) => OtpScreen(),
    ),
    GoRoute(path: '/SignupScreen',
    builder: (context, state) => SignupScreen(),
    ),
    GoRoute(path: '/PaymentCheckoutScreen',
    builder: (context, state) => CheckoutShippingScreen(),
    ),
    GoRoute(path: '/ForgotPassScreen',
    builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(path: '/DiscoverScreen',
    builder: (context, state) => DiscoverScreen(),
    ),
    GoRoute(path: '/OrderScreen',
    builder: (context, state) => MyOrdersBlocUi(),
    ),
    GoRoute(path: '/SearchScreen',
    builder: (context, state) => SearchScreen(),
    )

  ],
);
