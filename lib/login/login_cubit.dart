import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/login/login_model.dart';
import 'package:meta/meta.dart';

import '../core/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  late LoginModel loginModel;
  static LoginCubit get(context) => BlocProvider.of(context);
  void userlogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      if (value.data["token"] != null) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel));
      } else {
        emit(LoginErrorState(onError.toString()));
      }
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibiltiy() {
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    isPassword = !isPassword;
    emit(LoginChangePasswordVisibility());
  }

  void getAccept() {
    emit(AcceptLoadingState());
    DioHelper.getData(url: "academy-admin/profile/accepted").then((value) {
      emit(AcceptSuccessState(value.data["message"]));
    }).catchError((onError) {
      emit(AcceptErrorState(onError.toString()));
    });
  }
}
