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
    DioHelper.postData(url: "academy-admin/exams/addExam/${id}", data: data)
        .then((value) {
      final response = ResponseAddExamModel.fromJson(value.data);
      print(value.data);
      emit(AddExamSuccessState(response));
    }).catchError((onError) {
      print("errror");
      emit(AddExamErrorState(onError.toString()));
    });
  }
}
