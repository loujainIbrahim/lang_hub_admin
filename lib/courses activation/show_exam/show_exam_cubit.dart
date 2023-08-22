import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/courses%20activation/show_exam/show_exam_model.dart';
import 'package:meta/meta.dart';

part 'show_exam_state.dart';

class ShowExamCubit extends Cubit<ShowExamState> {
  ShowExamCubit() : super(ShowExamInitial());
  static ShowExamCubit get(context) => BlocProvider.of(context);
  ShowExamModel? showExamModel;
  void getExam(int id) {
    emit(ShowExamLoadingState());
    DioHelper.getData(url: "academy-admin/exams/$id").then((value) {
      print(value.data);
      showExamModel = ShowExamModel.fromJson(value.data);
      emit(ShowExamSuccessState(showExamModel!));
    }).catchError((onError) {
      emit(ShowExamErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}
