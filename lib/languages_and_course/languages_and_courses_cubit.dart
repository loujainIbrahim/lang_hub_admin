import 'package:bloc/bloc.dart';
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
      emit(LanguagesAndCoursesSuccessState());
    }).catchError((onError) {
      emit(LanguagesAndCoursesErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}
