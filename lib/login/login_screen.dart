import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/login/login_cubit.dart';
import 'dart:convert';
import 'dart:html' as html;
import '../ institute information/institute_information_screen.dart';
import '../core/network/cache_helper.dart';
import '../core/shared.dart';
import '../core/widgets/alert.dart';
import '../core/widgets/default_button.dart';
import '../core/widgets/text_button.dart';
import '../core/widgets/text_field.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = new TextEditingController();
    TextEditingController password = new TextEditingController();
    final _key = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            html.window.localStorage['auth_token'] = state.loginModel.token!;
            token=state.loginModel.token!;
            Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));

            print("from model");
       print(state.loginModel.token);
       print("from cache");
       print(token);
          } else if(state is LoginErrorState){
              showAlertDialog(context, "email or password not correct");
            }
          }
        ,
        builder: (context, state) {
          return Form(
            key: _key,
            child: Scaffold(
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/logo.png'),
                        myTextField(
                            height: 50,
                          maxxLines: 1,
                            controller: email,
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            validatorValue: "must be not empty"),
                        myTextField(
                          maxxLines: 1,
                          obscureText: LoginCubit.get(context).isPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              LoginCubit.get(context)
                                  .changePasswordVisibiltiy();
                            },
                            icon: Icon(LoginCubit.get(context).suffix),
                          ),
                          height: 50,
                          controller: password,
                          prefixIcon: Icon(Icons.lock),
                          labelText: "password",
                          validatorValue: "must be not empty",
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultbutton(
                              backround: Color(0xff210440),
                              text: 'Login',
                              textColor: Colors.white,
                              function: () {
                                if (_key!.currentState!.validate()) {
                                  LoginCubit.get(context).userlogin(
                                      email: email.text,
                                      password: password.text);
                                }
                              }),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "You don't have account?",
                              style:
                                  TextStyle(fontSize: ScreenUtil().setSp(30)),
                            ),
                            DefaultTextButton(
                                text: 'Sign up',
                                number: 30,
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              InstituteInformationScreen()));
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset('assets/images/login.png')],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
