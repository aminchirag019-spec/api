import 'package:api_learning/screens/intro_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Bloc/Authbloc/auth_bloc.dart';
import '../globall/utilities.dart';
import '../screens/dashboard.dart';
import '../screens/login_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/splash_screen.dart';

final GoRouter approuter = GoRouter(
  initialLocation: '/IntroOnboarding',
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
    builder: (context, state) => IntroOnboarding(),
    )

  ],
);
