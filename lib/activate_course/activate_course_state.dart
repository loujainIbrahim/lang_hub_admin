part of 'activate_course_cubit.dart';

@immutable
abstract class ActivateCourseState {}

class ActivateCourseInitial extends ActivateCourseState {}
class ActivateCourseSuccessState extends ActivateCourseState {}
class ActivateCourseLoadingState extends ActivateCourseState {}
class ActivateCourseErrorState extends ActivateCourseState {
  final String error;
  ActivateCourseErrorState(this.error);
}
