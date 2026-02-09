import 'package:api_learning/Bloc/Authbloc/auth_bloc.dart';
import 'package:api_learning/Bloc/Authbloc/auth_event.dart';
import 'package:api_learning/Bloc/Authbloc/auth_state.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_state.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Future.microtask((){
    context.read<AuthBloc>().add(CheckLogin());
  });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.status==ApiStatus.success) {
          context.go('/Dashboard');
        } else if (state.status == ApiStatus.failure) {
          context.go('/LoginScreen');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.brown,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to our clothes company",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )
              ),
              Image.asset(
                'assets/images/slider_image.png',
                width: 100,
                height: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
