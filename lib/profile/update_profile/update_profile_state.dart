part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileSuccessState extends UpdateProfileState {}
class UpdateProfileErrorState extends UpdateProfileState {
  final String error;
  UpdateProfileErrorState(this.error);
}
class UpdateProfileLoadingState extends UpdateProfileState {}
