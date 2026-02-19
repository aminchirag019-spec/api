import 'dart:async';
import 'package:api_learning/Bloc/Authbloc/auth_bloc.dart';
import 'package:api_learning/Bloc/Authbloc/auth_event.dart';
import 'package:api_learning/Bloc/Authbloc/auth_state.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:api_learning/router/router_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black.withOpacity(0.2), width: 1.2),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.black, width: 1.2),
    );

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.status == ApiStatus.success){
          context.go(RouterName.dashboardScreen.path);
        }
        if(state.status == ApiStatus.failure){
          Center(child: CircularProgressIndicator(),);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                InkWell(
                  onTap: () {
                    context.go(RouterName.loginScreen.path);
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                ),

                SizedBox(height: 28),

                Text(
                  "Verification code",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  "Please enter the verification code we sent\n"
                      "to your email address",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: 45),

                Center(
                  child: Pinput(
                    length: 4,
                    controller: _pinController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: defaultPinTheme,
                    showCursor: false,
                    pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                  ),
                ),
                SizedBox(height: 35),
                Text("Resend in 00:10"),

                Center(child:
                ElevatedButton(onPressed: () {
                  context.read<AuthBloc>().add(VerifyOtp(_pinController.text
                      .trim()));
                }, child: Text("Verify Otp"))
                  ,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
