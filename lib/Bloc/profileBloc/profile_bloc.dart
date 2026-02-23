import 'package:api_learning/Bloc/ProfileBloc/profile_event.dart';
import 'package:api_learning/Bloc/ProfileBloc/profile_state.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository repository;

  ProfileBloc(this.repository) : super(ProfileState()) {
    on<Profile>(_fetchProfile);
  }

  void _fetchProfile(Profile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      final profile = await repository.profile();
      emit(state.copyWith(status: ApiStatus.success, profileModel: profile));
    } catch (e) {
      emit(state.copyWith(status: ApiStatus.failure));
    }
  }
}
