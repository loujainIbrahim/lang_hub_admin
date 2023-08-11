import 'dart:convert';
import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:meta/meta.dart';

import 'add_course_model.dart';

part 'add_course_state.dart';

class AddCourseCubit extends Cubit<AddCourseState> {
  AddCourseCubit() : super(AddCourseInitial());

  static AddCourseCubit get(context) => BlocProvider.of(context);
  void AddCourse(
      {required String name,
      required String description,
      required int hours,
      required String language,
      required File course_image,
      required File pickedFile,
      required Uint8List? imageData}) async {
    emit(AddCourseLoading());
    final formData = FormData.fromMap({
      'name': name,
      'description': description,
      'hours': hours,
      'language': language,
      'course_image':
          MultipartFile.fromBytes(imageData!, filename: pickedFile.name),
    });
    try {
      final response = await DioHelper.postData(
          url: "/academy-admin/courses", data: formData);
      final responseData =jsonDecode(response.data);
     // final addCourseModel = Data.fromJson(response.data['data']);
     if(response !=null) print(responseData);
     else print("it is null");
      emit(AddCourseSuccess());
      print("add course done");
      // print(addCourseModel);
    } catch (error, stackTrace) {
      print("error add");
      print(error);
      print(stackTrace);
      if (error is DioError) {
        final response = error.response;
        if (response != null) {
          print(response.statusCode);
          print(response.data);
        }
      }
      emit(AddCourseError(error.toString()));
    }
  }
}
