part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccessState extends LoginState{
 final LoginModel loginModel;
 LoginSuccessState(this.loginModel);
}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState(this.error);
}
class LoginChangePasswordVisibility extends LoginState{}