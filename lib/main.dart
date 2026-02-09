import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/router/app_router.dart';
import 'package:api_learning/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/Authbloc/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepository(ApiClient())),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Api_learning',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: approuter,
      ),
    );
  }
}


