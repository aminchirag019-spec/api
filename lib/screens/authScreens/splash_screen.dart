import 'package:api_learning/router/router_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc/Authbloc/auth_bloc.dart';
import '../../Bloc/Authbloc/auth_event.dart';
import '../../Bloc/Authbloc/auth_state.dart';
import '../../globall/utilities.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _routing();
  }

  Future<void> _routing() async {
    final prefs = await SharedPreferences.getInstance();
    final done = prefs.getBool("onboardingDone") ?? false;
    print("ONBOARDING DONE => $done");
    if (!done) {
      if (!mounted) return;
      context.go(RouterName.onBoardingScreen.path);
      return;
    }

    if (!mounted) return;
    context.read<AuthBloc>().add(CheckLogin());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == ApiStatus.success) {
          context.go(RouterName.dashboardScreen.path);
        } else if (state.status == ApiStatus.failure) {
          context.go(RouterName.loginScreen.path);
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.brown,
        body: Center(
          child: CircularProgressIndicator(color: Colors.orange),
        ),
      ),
    );
  }
}
