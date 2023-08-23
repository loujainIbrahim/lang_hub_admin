part of 'active_course_cubit.dart';

@immutable
abstract class ActiveCourseState {}

class ActiveCourseInitial extends ActiveCourseState {}
class ActiveCourseSuccessState extends ActiveCourseState{
  ActivateCourseModel activateCourseModel;
  ActiveCourseSuccessState(this.activateCourseModel);
}
class ActiveCourseLoadingState extends ActiveCourseState{}
class ActiveCourseErrorState extends ActiveCourseState{
  String error;
  ActiveCourseErrorState(this.error);
}


class DeleteExamSuccessState extends ActiveCourseState{
 // ActivateCourseModel activateCourseModel;
  final String message;
  DeleteExamSuccessState(this.message);
}
class DeleteExamLoadingState extends ActiveCourseState{}
class DeleteExamErrorState extends ActiveCourseState{
  String error;
  DeleteExamErrorState(this.error);
}