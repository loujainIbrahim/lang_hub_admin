import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/courses%20activation/activate_course_model.dart';
import 'package:meta/meta.dart';

part 'active_course_state.dart';

class ActiveCourseCubit extends Cubit<ActiveCourseState> {
  ActiveCourseCubit() : super(ActiveCourseInitial());
  static ActiveCourseCubit get(context) => BlocProvider.of(context);
  ActivateCourseModel? activateCourseModel;
  void getActiveCourses(String language) {
    emit(ActiveCourseLoadingState());
    DioHelper.getData(
        url: "academy-admin/courses/active",
        query: {"language": language}).then((value) {
      activateCourseModel = ActivateCourseModel.fromJson(value.data);
      print(value.data);
      emit(ActiveCourseSuccessState(activateCourseModel!));
    }).catchError((onError) {
      emit(ActiveCourseErrorState(onError.toString()));
    });
  }

  void deleteExam(int id) {
    emit(DeleteExamLoadingState());
    DioHelper.deleteData(url: "academy-admin/exams/deleteExam/$id")
        .then((value) {
      emit(DeleteExamSuccessState(value.data["message"]));
    }).catchError((onError) {
      emit(DeleteExamSuccessState(onError.toString()));
      print(onError.toString());
    });
  }
}
