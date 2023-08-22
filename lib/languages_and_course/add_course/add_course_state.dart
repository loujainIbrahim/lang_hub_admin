part of 'add_course_cubit.dart';

@immutable
abstract class AddCourseState {}

class AddCourseInitial extends AddCourseState {}
class AddCourseLoading extends AddCourseState{}
class AddCourseSuccess extends AddCourseState{

  AddCourseSuccess();
}
class AddCourseError extends AddCourseState{
  final String error;
  AddCourseError(this.error);
}