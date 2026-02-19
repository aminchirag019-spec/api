import 'package:api_learning/router/router_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final confirmPassController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),

                const Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "your account",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 45),

                _UnderlineTextField(
                  controller: nameController,
                  hint: "Enter your name",
                ),
                const SizedBox(height: 30),

                _UnderlineTextField(
                  controller: emailController,
                  hint: "Email address",
                ),
                const SizedBox(height: 30),

                _UnderlineTextField(
                  controller: passController,
                  hint: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 30),

                _UnderlineTextField(
                  controller: confirmPassController,
                  hint: "Confirm password",
                  isPassword: true,
                ),

                const SizedBox(height: 50),

                Center(
                  child: SizedBox(
                    height: 52,
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3B2B25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

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
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        //  image: DecorationImage(image: AssetImage("assets/images/Apple2.png")),
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
                SizedBox(height: 45,),

                GestureDetector(
                  onTap: () {
                    context.go(RouterName.loginScreen.path);
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: "Already have account? "),
                          TextSpan(
                            text: "Log In",
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

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UnderlineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  const _UnderlineTextField({
    required this.controller,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.45),
          fontSize: 14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
  }
