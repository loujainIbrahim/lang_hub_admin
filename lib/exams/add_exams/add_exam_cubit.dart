import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/exams/add_exams/response_add_exam_model.dart';
import 'package:meta/meta.dart';

part 'add_exam_state.dart';

class AddExamCubit extends Cubit<AddExamState> {
  AddExamCubit() : super(AddExamInitial());
  static AddExamCubit get(context) => BlocProvider.of(context);
  void Addexam(int id, List<Map<String, dynamic>> data) {
    emit(AddExamLoadingState());
    print(id);
    // print(json.encode(data));
    var body=json.encode(data);
    print(body);
    DioHelper.postData(url: "academy-admin/exams/addExam/$id", data:body ).then((value) {
      // final response = ResponseAddExamModel.fromJson(value.data);

     // final dd = json.decode(value.data);
      print(value.data);
      //final response = ResponseAddExamModel.fromJson(json.decode(value.data));
      emit(AddExamSuccessState());
      print("success");
    }).catchError((onError) {
      print(onError.toString());
      emit(AddExamErrorState(onError.toString()));
    });
  }
}
