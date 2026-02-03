

import 'package:api_learning/bloc/event.dart';
import 'package:api_learning/bloc/state.dart';
import 'package:api_learning/data/models.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthState()) {
    on<Login>(_requestLogin);
  }

  void _requestLogin(
      Login event,
      Emitter<AuthState> emit,
      ) async {
    emit(state.copyWith(status: ApiStatus.loading));

    try {
      LoginModel loginModel = await repository.login(body: event.body);
      if (success) {
        emit(state.copyWith(status: ApiStatus.success));
      } else {
        emit(
          state.copyWith(
            status: ApiStatus.failure,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ApiStatus.failure,
        ),
      );
    }
  }
}
