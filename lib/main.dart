import 'package:api_learning/Bloc/DashboardBloc/dashboard_bloc.dart';
import 'package:api_learning/Bloc/DashboardBloc/dashboard_event.dart';
import 'package:api_learning/Bloc/cartBloc/cart_bloc.dart';
import 'package:api_learning/Bloc/checkoutBloc/checkout_bloc.dart';
import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities/colors.dart';
import 'package:api_learning/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/Authbloc/auth_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.brown
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final authRepo = AuthRepository(apiClient);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepo),
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(authRepo)..add(GetProduct()),
        ),
        BlocProvider<CheckoutBloc>(create: (_) => CheckoutBloc(),),
        BlocProvider<CartBloc>(create: (_) => CartBloc((authRepo)),)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Api_learning',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: approuter,
      ),
    );
  }
}
