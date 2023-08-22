part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  ProfileModel profileModel;
  ProfileSuccessState(this.profileModel);
}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
}


class UpdateProfileSuccessState extends ProfileState {}
class UpdateProfileErrorState extends ProfileState {
  final String error;
  UpdateProfileErrorState(this.error);
}
class UpdateProfileLoadingState extends ProfileState {}

class ChangePasswordSuccessState extends ProfileState {}
class ChangePasswordErrorState extends ProfileState {
  final String error;
  ChangePasswordErrorState(this.error);
}
class ChangePasswordLoadingState extends ProfileState {}