import 'dart:convert';
import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/languages_and_course/language_and_courses_model.dart';
import 'package:meta/meta.dart';

part 'languages_and_courses_state.dart';

class LanguagesAndCoursesCubit extends Cubit<LanguagesAndCoursesState> {
  LanguagesAndCoursesCubit() : super(LanguagesAndCoursesInitial());
  static LanguagesAndCoursesCubit get(context) => BlocProvider.of(context);
  LanguageCourseModel? languageCourseModel;
  void GetLanguageAndCourses(String language) {
    emit(LanguagesAndCoursesLoadingState());
    DioHelper.getData(
        url: "academy-admin/courses/inactive",
        query: {"language": language}).then((value) {
      languageCourseModel = LanguageCourseModel.fromJson(value.data);
      emit(LanguagesAndCoursesSuccessState(languageCourseModel!));
      print("get successss");
    }).catchError((onError) {
      emit(LanguagesAndCoursesErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  void DeleteCourse(int id) {
    emit(DeleteCoursesLoadingState());
    DioHelper.deleteData(url: "academy-admin/courses/$id/").then((value) {
      print(value.data);
      emit(DeleteCoursesSuccessState());
    }).catchError((onError) {
      emit(DeleteCoursesErrorState(onError.toString()));
    });
  }
  // void refreshCourses() {
  //   emit(LanguagesAndCoursesSuccessState(languageCourseModel));
  // }
  void AddCourse(
      {required String name,
      required String description,
      required int hours,
      required String language,
      required File course_image,
      required File pickedFile,
      required Uint8List? imageData}) async {
    emit(AddCourseLoading());
    // String hh = hours.toString();
    final formData = FormData.fromMap({
      'name': name,
      'description': description,
      'hours': hours,
      'language': language,
      'course_image':
          MultipartFile.fromBytes(imageData!, filename: pickedFile.name),
    });
    ///////////

    final response =
        DioHelper.postData(url: "academy-admin/courses", data: formData)
            .then((value) {
      //final course=AddCourseModel.fromJson(json.decode(value.data));
      print(json.encode(value.data));
      emit(AddCourseSuccess());
     // refreshCourses();
      print("succcessssss");
    }).catchError((onError) {
      print(formData);
      print(onError.toString());
      emit(AddCourseError(onError.toString()));
    });

    // // final responseData =jsonDecode(response.data);
    // //final addCourseModel = Data.fromJson(response.data);
    // print(response.data);
    // print("add course done");
    // // print(addCourseModel);
  }
}
