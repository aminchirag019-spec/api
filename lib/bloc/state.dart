import 'package:api_learning/globall/utilities.dart';
import 'package:equatable/equatable.dart';

import '../data/models.dart';

class AuthState extends Equatable {
  final LoginModel? loginModel;
  final ApiStatus? status;
  const AuthState({this.loginModel, this.status = ApiStatus.initial});

  AuthState copyWith({ApiStatus? status, LoginModel? loginModel}) {
    return AuthState(
      status: status ?? this.status,
      loginModel: loginModel ?? this.loginModel,
    );
  }

  @override
  List<Object?> get props => [status, loginModel];
}
