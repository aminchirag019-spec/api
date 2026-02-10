import 'dart:math';
import 'package:api_learning/models/models.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:api_learning/screens/dashboard.dart';
import 'package:api_learning/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../Bloc/Authbloc/auth_bloc.dart';
import '../Bloc/Authbloc/auth_event.dart';
import '../Bloc/Authbloc/auth_state.dart';
import '../session/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,AuthState>(
      listener: (context, state) {
        if(state.status == ApiStatus.success){
          context.go('/OtpScreen');
        }
        if (state.status == ApiStatus.failure){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30
                  ),
                  child: Row(
                    children: [
                      Text("Log into\nyour account",
                        style: TextStyle(
                            fontSize: 25,
                          height: 2,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: CoustomTextFormField(
                    hintText: "Email address",
                    lableText: "Username" ,
                    controller: usernameController,
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: CoustomTextFormField(
                    hintText: "Password",
                    lableText: "Password",
                    controller: emailController,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("forgot password?"),
                  ],
                ),
                SizedBox(height: 60,),
                ElevatedButton(onPressed: () async{
                  context.read<AuthBloc>().add(Login({
                      'username':usernameController.text.trim(),
                      'password':emailController.text.trim(),
                    }
                  ));
                },style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                    child: Text("Log in",style: TextStyle(color: Colors.white),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget CoustomTextFormField({
  TextEditingController? controller,
  required String hintText,
  required String lableText,
  Key? key,
}) {
  return TextFormField(
    style: TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
    controller: controller,
    key: key,
    decoration: InputDecoration(
      hintText: hintText,
    ),
  );
}
