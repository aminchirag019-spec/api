

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:pinput/pinput.dart';

import '../../Bloc/Authbloc/auth_bloc.dart';
import '../../Bloc/Authbloc/auth_event.dart';
import '../../Bloc/Authbloc/auth_state.dart';
import '../../globall/utilities/api_url.dart';
import '../../router/router_class.dart';
import '../paymentScreens/shipping_screen.dart';

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
    context.read<AuthBloc>().add(StartOtpTimer());
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
      textStyle:  TextStyle(
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
        if(state.status == ApiStatus.otpAuthenticated){
          context.go(RouterName.dashboardScreen.path);
        }
        if(state.status == ApiStatus.failure){
          Fluttertoast.showToast(msg: "Invalid Otp");
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
                Row(
                  children: [
                    CircleBackButton(onTap: () => context.go(RouterName.loginScreen.path),),
                  ],
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
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state.canResend) {
                      return TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(ResendOtp());
                        },
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }

                    return Text(
                      "Resend in 00:${state.seconds.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),
                Center(child:
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading = state.status == ApiStatus.loading;
                    return SizedBox(
                      width: 150,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                          context.read<AuthBloc>().add(VerifyOtp(otp: _pinController.text
                              .trim()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xff2D201C),
                        ),
                        child: isLoading
                            ?  SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            :  Text(
                          "Verify Otp",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
