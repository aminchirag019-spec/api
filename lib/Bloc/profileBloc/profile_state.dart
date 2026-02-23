
import 'package:api_learning/models/models.dart';
import 'package:api_learning/globall/utilities/api_url.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

class ProfileState extends Equatable{
  final ApiStatus status;
  final ProfileModel? profileModel;


  ProfileState({
    this.status = ApiStatus.initial,
    this.profileModel,
  });

  ProfileState copyWith({
    ApiStatus? status,
    ProfileModel? profileModel,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profileModel: profileModel ?? this.profileModel,
    );

  }
  @override
  List<Object?> get props => [
    status,
    profileModel,
  ];
}
