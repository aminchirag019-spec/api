import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/models/otp_model.dart';
import 'package:api_learning/models/signup_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/auth_model.dart';
import '../../models/models.dart';

class AuthState extends Equatable {
  final LoginModel? loginModel;
  final ApiStatus? status;
  final Signup? signup;
  final OtpModel? otpModel;
  final String? error;
  final int seconds;
  final bool canResend;
  const AuthState({
    this.loginModel,
    this.status = ApiStatus.initial,
    this.otpModel,
    this.error,
    this.canResend = false,
    this.seconds = 10,
    this.signup
  });
  AuthState copyWith({
    ApiStatus? status,
    LoginModel? loginModel,
    OtpModel? otpModel,
    String? error,
    int? seconds,
    bool? canResend,
    Signup? signup
  }) {
    return AuthState(
      status: status ?? this.status,
      loginModel: loginModel ?? this.loginModel,
      otpModel: otpModel ?? this.otpModel,
      error: error ?? this.error,
      seconds: seconds ?? this.seconds,
      canResend: canResend ?? this.canResend,
      signup: signup ?? this.signup
    );
  }

  @override
  List<Object?> get props => [
    status,
    loginModel,
    otpModel,
    error,
    seconds,
    canResend,
    signup
  ];
}
