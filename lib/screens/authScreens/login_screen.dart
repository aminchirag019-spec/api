import 'dart:math';
import 'package:api_learning/models/models.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/DashboardScreen/dashboard.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Bloc/Authbloc/auth_bloc.dart';
import '../../Bloc/Authbloc/auth_event.dart';
import '../../Bloc/Authbloc/auth_state.dart';
import '../../session/google_login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter the email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == ApiStatus.success) {
          context.go(RouterName.otpScreen.path);
        }
        if (state.status == ApiStatus.failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error")));
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          "Log into \nYour account",
                          style: TextStyle(
                            fontSize: 30,
                            height: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Form(
                        key: _formkey,
                        child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: CoustomTextFormField(
                            validator: validateEmail,
                            hintText: "Email address",
                            lableText: "Username",
                            controller: usernameController,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: CoustomTextFormField(
                            validator: validatePassword,
                            hintText: "Password",
                            lableText: "Password",
                            controller: emailController,
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.go(RouterName.forgotPassScreen.path);
                          },
                          child: Text("Forgot Password?"),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final isLoading = state.status == ApiStatus.loading;

                  return SizedBox(
                    width: 150,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                        if (!_formkey.currentState!.validate()) return;
                        context.read<AuthBloc>().add(
                          Login({
                            'username': usernameController.text.trim(),
                            'password': emailController.text.trim(), // ✅ fixed
                          }),

                        );

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2D201C),
                      ),
                      child: isLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                          : const Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image(
                            image: AssetImage("assets/images/Apple.png"),
                          ),
                        ),
                        SizedBox(width: 12),
                GestureDetector(
                  onTap:() async {
                    try {
                      final user = await GoogleAuthHelper.signInWithGoogle();
                      if (user == null) return;
                      if (!context.mounted) return;
                      context.go(RouterName.dashboardScreen.path);
                    } catch (e) {
                      debugPrint("Google Registration/Login Error: $e");
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Google Registration failed: $e")),
                      );
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Google.png"),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                        SizedBox(width: 12),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image(
                            image: AssetImage("assets/images/facebook.png"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        context.go(RouterName.signupScreen.path);
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: [
                              TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
  required FormFieldValidator<String> validator,
}) {
  return TextFormField(
    style: const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    validator: validator,
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: key,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.20), fontWeight: FontWeight.w400),
    ),
  );
}
