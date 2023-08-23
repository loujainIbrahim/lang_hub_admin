part of 'activate_course_cubit.dart';

@immutable
abstract class ActivateCourseState {}

class ActivateCourseInitial extends ActivateCourseState {}
class ActivateCourseSuccessState extends ActivateCourseState {
  final String message;
  ActivateCourseSuccessState(this.message);
}
class ActivateCourseLoadingState extends ActivateCourseState {}
class ActivateCourseErrorState extends ActivateCourseState {
  final String error;
  ActivateCourseErrorState(this.error);
}

class GetTeacherForCourseSuccessState extends ActivateCourseState {
  final String message;
  GetTeacherForCourseSuccessState(this.message);
}
class GetTeacherForCourseLoadingState extends ActivateCourseState {}
class GetTeacherForCourseErrorState extends ActivateCourseState {
  final String error;
  GetTeacherForCourseErrorState(this.error);
}
