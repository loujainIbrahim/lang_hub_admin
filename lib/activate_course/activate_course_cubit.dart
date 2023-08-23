import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/home/models/teachers_model.dart';
import 'package:meta/meta.dart';

import '../courses activation/active_course_cubit.dart';

part 'activate_course_state.dart';

class ActivateCourseCubit extends Cubit<ActivateCourseState> {
  ActivateCourseCubit() : super(ActivateCourseInitial());
  TeachersModel? teachersModel;
  List<dynamic>? teacherData;
  List<String> teacherNames = [];
  String? message;
  int? SelectedItemIndex;
  static ActivateCourseCubit get(context) => BlocProvider.of(context);
  void getTeacherforCourse(
      int id,
      int sat,
      String sat1,
      String sat2,
      int sun,
      String sun1,
      String sun2,
      int mon,
      String mon1,
      String mon2,
      int tues,
      String tues1,
      String tues2,
      int wedns,
      String wedns1,
      String wedns2,
      int thurs,
      String thurs1,
      String thurs2,
      int fri,
      String fri1,
      String fri2) async {
    emit(GetTeacherForCourseLoadingState());
    var body = {
      "saturday": sat,
      "start_saturday": sat1,
      "end_saturday": sat2,
      "sunday": sun,
      "start_sunday": sun1,
      "end_sunday": sun2,
      "monday": mon,
      "start_monday": mon1,
      "end_monday": mon2,
      "tuesday": tues,
      "start_tuesday": tues1,
      "end_tuesday": tues2,
      "wednsday": wedns,
      "start_wednsday": wedns1,
      "end_wednsday": wedns2,
      "thursday": thurs,
      "start_thursday": thurs1,
      "end_thursday": thurs2,
      "friday": fri,
      "start_friday": fri1,
      "end_friday": fri2
    };
    // String requestBody = json.encode(body);
    DioHelper.getData(
            url: "academy-admin/courses/$id/checkTeacher", query: body)
        .then((value) {
       teachersModel = TeachersModel.fromJson(value.data);
      print(id);
      print(teachersModel!.message);
       message=teachersModel!.message;
       print(teachersModel!.status);
      teacherData = value.data["data"];
      print(teacherData!.length);
      if (teacherData != null) {
        teacherNames = teacherData!
            .map(
                (teacher) => '${teacher['first_name']} ${teacher['last_name']}')
            .toList();
      }
      print(teacherNames!.length);
      print("success");

      emit(GetTeacherForCourseSuccessState(teachersModel!.message!));
    }).catchError((onError) {
      emit(GetTeacherForCourseErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  void ActiveCoursePost(
      int id,
      int sets,
      DateTime startDate,
      DateTime endDate,
      int price,
      int selectedIndex,
      int sat,
      String sat1,
      String sat2,
      int sun,
      String sun1,
      String sun2,
      int mon,
      String mon1,
      String mon2,
      int tues,
      String tues1,
      String tues2,
      int wedns,
      String wedns1,
      String wedns2,
      int thurs,
      String thurs1,
      String thurs2,
      int fri,
      String fri1,
      String fri2) {
    emit(ActivateCourseLoadingState());
    String thursValue = thurs != null ? thurs.toString() : "-";
    var body = json.encode({
      "seats": sets,
      "start_date": DateFormat('yyyy-MM-dd').format(startDate),
      "end_date": DateFormat('yyyy-MM-dd').format(endDate),
      "price": price,
      "teacher_id": selectedIndex,
      "saturday": sat,
      "start_saturday": sat1,
      "end_saturday": sat2,
      "sunday": sun,
      "start_sunday": sun1,
      "end_sunday": sun2,
      "monday": mon,
      "start_monday": mon1,
      "end_monday": mon2,
      "tuesday": tues,
      "start_tuesday": tues1,
      "end_tuesday": tues2,
      "wednsday": wedns,
      "start_wednsday": wedns1,
      "end_wednsday": wedns2,
      "thursday": thurs,
      "start_thursday": thurs1,
      "end_thursday": thurs2,
      "friday": fri,
      "start_friday": fri1,
      "end_friday": fri2
    });
    DioHelper.postData(url: "academy-admin/courses/$id/active", data: body)
        .then((value) {
          String message=value.data["message"];
        emit(ActivateCourseSuccessState(message));
        print("success");
        // print(json.encode(value.data));
        print(value.data);
        // List<int> response=value.data;
        // String responseString = String.fromCharCodes(response);
        // print(responseString);
        print(value.data);

    }).catchError((onError) {
      emit(ActivateCourseErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}
