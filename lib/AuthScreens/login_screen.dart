import 'dart:math';
import 'package:api_learning/models/models.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:api_learning/screens/DashboardScreen/dashboard.dart';
import 'package:api_learning/AuthScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../Bloc/Authbloc/auth_bloc.dart';
import '../Bloc/Authbloc/auth_event.dart';
import '../Bloc/Authbloc/auth_state.dart';
import '../session/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController(text: "emilyspass");
  TextEditingController usernameController = TextEditingController(text: "emilys");
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(30),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.go('/IntroOnboarding');
                          },
                          child: Icon(Icons.arrow_back_ios,size: 22,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Text("Log into\nyour account",
                        style: TextStyle(
                            fontSize: 30,
                          height: 2,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CoustomTextFormField(
                      hintText: "Email address",
                      lableText: "Username" ,
                      controller: usernameController,
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
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
                      GestureDetector(
                          onTap: () {
                            context.go('/ForgotPassScreen');
                          },
                          child: Text("Forgot Password?")),
                    ],
                  ),
                  SizedBox(height: 60,),
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
                            context.read<AuthBloc>().add(
                              Login({
                                'username': usernameController.text.trim(),
                                'password': emailController.text.trim(),
                              }),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Color(0xff2D201C),
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
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height:20,),
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
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Image(image: AssetImage("assets/images/Apple.png")),
                      ),
                      SizedBox(width: 12,),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/Google.png")),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Image(image: AssetImage("assets/images/Google.png")),
                      ),
                      SizedBox(width: 12,),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Image(image: AssetImage("assets/images/facebook.png")),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () {
                      context.go('/SignupScreen');
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: "Don't have an account? "),
                            TextSpan(
                              text: "Sign Up",
                              style: const TextStyle(
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
      hintStyle: TextStyle(
        color:  Color(0xff000000),
        fontWeight: FontWeight.w400
      )
    ),
  );
}
