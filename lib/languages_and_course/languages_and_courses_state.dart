part of 'languages_and_courses_cubit.dart';

@immutable
abstract class LanguagesAndCoursesState {}

class LanguagesAndCoursesInitial extends LanguagesAndCoursesState {}

class LanguagesAndCoursesSuccessState extends LanguagesAndCoursesState {
  LanguageCourseModel languageCourseModel;

  LanguagesAndCoursesSuccessState(this.languageCourseModel);
}

class LanguagesAndCoursesLoadingState extends LanguagesAndCoursesState {}

class LanguagesAndCoursesErrorState extends LanguagesAndCoursesState {
  final String error;
  LanguagesAndCoursesErrorState(this.error);
}

class DeleteCoursesLoadingState extends LanguagesAndCoursesState {}

class DeleteCoursesSuccessState extends LanguagesAndCoursesState {}

class DeleteCoursesErrorState extends LanguagesAndCoursesState {
  final String error;
  DeleteCoursesErrorState(this.error);
}

// class AddCourseLoading extends LanguagesAndCoursesState {}
//
// class AddCourseSuccess extends LanguagesAndCoursesState {
//   final String message;
//   AddCourseSuccess(this.message);
// }
//
// class AddCourseError extends LanguagesAndCoursesState {
//   final String error;
//   AddCourseError(this.error);
// }
