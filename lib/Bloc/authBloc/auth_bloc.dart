import 'dart:async';
import 'dart:developer';
import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/models/models.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:api_learning/models/otp_model.dart';
import 'package:api_learning/screens/DashboardScreen/dashboard.dart';
import 'package:api_learning/session/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/auth_model.dart';
import '../cartBloc/cart_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class   AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  Timer? _otpTimer;
  AuthBloc(this.repository) : super(AuthState()) {
    on<Login>(_requestLogin);
    on<CheckLogin>(_checkLogin);
    on<Logout>(_onLogout);
    on<SendOtp>(_onSendOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<StartOtpTimer>(_onStartOtpTimer);
    on<TickOtpTimer>(_onTickOtpTimer);
    on<ResendOtp>(_onResendOtp);
  }

  void _onStartOtpTimer(StartOtpTimer event, Emitter<AuthState> emit) {
    _otpTimer?.cancel();

    emit(state.copyWith(seconds: 10, canResend: false));

    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(TickOtpTimer());
    });
  }

  void _onTickOtpTimer(TickOtpTimer event, Emitter<AuthState> emit) {
    if (state.seconds > 1) {
      emit(state.copyWith(seconds: state.seconds - 1));
    } else {
      _otpTimer?.cancel();
      emit(state.copyWith(seconds: 0, canResend: true));
    }
  }

  void _onResendOtp(ResendOtp event, Emitter<AuthState> emit) {
    add(StartOtpTimer());
  }

  void _onSendOtp(SendOtp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
  }

  void _onVerifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));

    if (event.otp == "1234") {
      emit(
        state.copyWith(
          status: ApiStatus.otpAuthenticated,
          otpModel: OtpModel(otp: event.otp),
        ),
      );
    } else {
      emit(state.copyWith(status: ApiStatus.failure, error: "Invalid Otp"));
    }
  }
  void _requestLogin(Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      LoginModel loginModel = await repository.login(body: event.body);
      SharedPref.saveLoginModel(loginModel);
      SharedPref.getAccessToken();
      print("Your access token is:${loginModel.accessToken}");
      emit(state.copyWith(status: ApiStatus.success, loginModel: loginModel));
    } catch (e, stackTrace) {
      log("LOGIN ERROR: $e");
      log("STACKTRACE: $stackTrace");
      emit(state.copyWith(status: ApiStatus.failure));
    }
  }

  void _checkLogin(CheckLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));

    try {
      final token = await SharedPref.getAccessToken();
      if (token != null && token.isNotEmpty) {
        final loginModel = await SharedPref.getLoginModel();
        emit(state.copyWith(status: ApiStatus.success, loginModel: loginModel));
      } else {
        emit(state.copyWith(status: ApiStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.failure));
    }
  }

  void _onLogout(Logout event, Emitter<AuthState> emit) async {
    await SharedPref.clearLogin();
    emit(state.copyWith(status: ApiStatus.failure, loginModel: null));
  }
}
