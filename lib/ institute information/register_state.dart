part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterSuccessState extends RegisterState{
  RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);
}
class RegisterLoadingState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  final String error;
  RegisterErrorState(this.error);
}
