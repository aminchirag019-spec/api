import 'package:api_learning/AuthScreens/forgot_pass_screen.dart';
import 'package:api_learning/screens/discover_screen.dart';
import 'package:api_learning/screens/intro_screen.dart';
import 'package:api_learning/AuthScreens/otp_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Bloc/Authbloc/auth_bloc.dart';
import '../globall/utilities.dart';
import '../screens/DashboardScreen/dashboard.dart';
import '../AuthScreens/login_screen.dart';
import '../screens/payment_checkout_screen.dart';
import '../screens/product_details_screen.dart';
import '../AuthScreens/profile_screen.dart';
import '../screens/signup_screen.dart';
import '../AuthScreens/splash_screen.dart';

final GoRouter approuter = GoRouter(
  initialLocation: '/SplashScreen',
  routes: [
    GoRoute(
      path: '/SplashScreen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/LoginScreen',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/Dashboard',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: '/ProfileScreen',
      builder: (context, state) => const ProfileScreen(),
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
    )

  ],
);
