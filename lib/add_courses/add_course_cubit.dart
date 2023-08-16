import 'dart:convert';
import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';
import 'package:http/http.dart'as http;
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
        DioHelper.postData(url: "/academy-admin/courses", data:formData )
            .then((value) {
              final course=AddCourseModel.fromJson(json.decode(value.data));
              print(value.data);
      emit(AddCourseSuccess());
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

  //////////////



  // Future<void> addCourseToApi({
  //   required String name,
  //   required String description,
  //   required int hours,
  //   required String language,
  //   required html.File imageData,
  // }) async {
  //   try {
  //     // Create a multipart request
  //     var request =
  //     http.MultipartRequest('POST', Uri.parse("http://localhost:8000/api/academy-admin/courses"
  //     ));
  //
  //     // Add course data to the request
  //     request.fields['name'] = name;
  //     request.fields['description'] = description;
  //     request.fields['hours'] = hours.toString();
  //     request.fields['language'] = language;
  //
  //     // Read the contents of the image file as an array buffer
  //     final reader = html.FileReader();
  //     reader.readAsArrayBuffer(imageData);
  //     await reader.onLoadEnd.first;
  //     final arrayBuffer = reader.result as Uint8List;
  //
  //     // Get the file extension
  //     final fileExtension = imageData.name.split('.').last;
  //
  //     // Determine the media type based on the file extension
  //     // final mediaType = MediaType.parse(
  //     //     'image/$fileExtension'); // Replace 'image' with the appropriate media type for your file
  //
  //     // Create a multipart file from the array buffer
  //     var imageFile = http.MultipartFile.fromBytes(
  //       'course_image',
  //       arrayBuffer,
  //       filename: imageData.name,
  //       //contentType: mediaType,
  //     );
  //
  //     // Attach the image file to the request
  //     request.files.add(imageFile);
  //
  //     // Send the request and get the response
  //     var response = await request.send();
  //
  //     // Handle the response
  //     if (response.statusCode == 200) {
  //       // Course added successfully
  //       print('Course added successfully');
  //     } else {
  //       // Handle error response
  //       print('Failed to add course. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle any exceptions that occur during the request
  //     print('Error adding course: $error');
  //   }
  // }
}
