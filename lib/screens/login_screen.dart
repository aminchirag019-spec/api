import 'dart:math';

import 'package:api_learning/bloc/bloc.dart';
import 'package:api_learning/bloc/event.dart';
import 'package:api_learning/bloc/state.dart';
import 'package:api_learning/data/models.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:api_learning/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
        }
        if (state.status == ApiStatus.failure){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("LoginScreen")),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 300,
                  child: CoustomTextFormField(
                    hintText: "Enter your Username",
                    lableText: "Username" ,
                    controller: usernameController,
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: CoustomTextFormField(
                    hintText: "Enter your password",
                    lableText: "Password",
                    controller: emailController,
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  context.read<AuthBloc>().add(Login({
                      'username':usernameController.text.trim(),
                      'password':emailController.text.trim(),
                    }
                  ));
                },
                    child: Text("Log in")
                )
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
    controller: controller,
    key: key,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: lableText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );
}
