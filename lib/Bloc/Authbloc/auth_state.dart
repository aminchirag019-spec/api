import 'package:api_learning/globall/utilities.dart';
import 'package:api_learning/models/otp_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/auth_model.dart';
import '../../models/models.dart';

class AuthState extends Equatable {
  final LoginModel? loginModel;
  final ApiStatus? status;
  final OtpModel? otpModel;

  const AuthState({this.loginModel, this.status = ApiStatus.initial,this.otpModel});

  AuthState copyWith({ApiStatus? status, LoginModel? loginModel,OtpModel? otpModel}) {
    return AuthState(
      status: status ?? this.status,
      loginModel: loginModel ?? this.loginModel,
      otpModel: otpModel ?? this.otpModel,
    );
  }

  @override
  List<Object?> get props => [status, loginModel,otpModel];
}


