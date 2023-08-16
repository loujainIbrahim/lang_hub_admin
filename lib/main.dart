import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/courses%20activation/active_course_cubit.dart';
import 'package:lang_hub_admin/home/home_screen.dart';
import 'package:lang_hub_admin/languages_and_course/languages_and_courses_cubit.dart';
import ' institute information/institute_information_screen.dart';
import ' institute information/select_image.dart';
import 'add_offer/add_offer_screen.dart';
import 'core/network/DioHelper.dart';
import 'core/network/cache_helper.dart';
import 'core/shared.dart';
import 'exams/add_exams/add_exams_screen.dart';
import 'home/home_cubit/home_cubit.dart';
import 'login/login_screen.dart';
import 'dart:convert';
import 'dart:html' as html;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
 // await CacheHelper.init();
 // token = await CacheHelper.getData(key: 'token');
  token = html.window.localStorage['auth_token'];
  print(token);
  Widget widget = Container();
  if (token != null)
    widget = HomeScreen();
  else
    widget = LoginScreen();
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
   MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => HomeCubit()..getSudents()..getTeachers()
         //HomeCubit يعني كأنو عم ساوي اوبجيكت من ال..
      ),
      BlocProvider(create: (context)=>ActiveCourseCubit()..getActiveCourses("english")),
      BlocProvider(create: (context)=>LanguagesAndCoursesCubit()..GetLanguageAndCourses("english"))

    ], child: ScreenUtilInit(
      designSize: Size(1920, 1080),
      builder: (context , child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LangHub',
        home: startWidget,
      ),
    ));
  }
}