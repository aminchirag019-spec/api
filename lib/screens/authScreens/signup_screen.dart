import 'package:api_learning/Bloc/Authbloc/auth_event.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:api_learning/screens/paymentScreens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Bloc/Authbloc/auth_bloc.dart';
import '../../Bloc/Authbloc/auth_state.dart';
import '../../globall/utilities/api_url.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final confirmPassController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.loginScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleBackButton(
                        onTap: () => context.go(RouterName.loginScreen.path),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Text(
                    "Create Your Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  SizedBox(height: 45),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _UnderlineTextField(
                          controller: firstNameController,
                          hint: "Enter FirstName",
                          isPassword: false,
                        ),
                        SizedBox(height: 30),

                        _UnderlineTextField(
                          controller: lastNameController,
                          hint: "Enter LastName",
                          isPassword: false,
                        ),
                        SizedBox(height: 30),

                        _UnderlineTextField(
                          controller: emailController,
                          hint: "Email address",
                          isPassword: false,
                          validator: validateEmail,
                        ),
                        SizedBox(height: 30),

                        _UnderlineTextField(
                          controller: passController,
                          hint: "Password",
                          isPassword: true,
                          validator: validatePassword,
                        ),
                        SizedBox(height: 30),

                        _UnderlineTextField(
                          controller: confirmPassController,
                          hint: "Confirm password",
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if(state.status == ApiStatus.success) {
                          context.go(RouterName.dashboardScreen.path);
                        }
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state.status == ApiStatus.loading;
                          return SizedBox(
                            width: 150,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      if (!formKey.currentState!.validate())
                                        return;
                                      print("button pressed");
                                      context.read<AuthBloc>().add(
                                        AddUser(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          email: emailController.text,
                                        ),
                                      );
                                      lastNameController.clear();
                                      firstNameController.clear();
                                      passController.clear();
                                      confirmPassController.clear();
                                      emailController.clear();
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff2D201C),
                              ),
                              child: isLoading
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("OR", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  SizedBox(height: 18),
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
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Google.png"),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image(
                          image: AssetImage("assets/images/Google.png"),
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
                  SizedBox(height: 45),

                  GestureDetector(
                    onTap: () {
                      context.go(RouterName.loginScreen.path);
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          children: [
                            TextSpan(text: "Already have account? "),
                            TextSpan(
                              text: "Log In",
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
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _UnderlineTextField({
  required TextEditingController controller,
  required String hint,
  required bool isPassword,
  FormFieldValidator<String>? validator,
}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.20), fontSize: 14),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
    ),
  );
}
