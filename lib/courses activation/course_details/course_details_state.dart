part of 'course_details_cubit.dart';

@immutable
abstract class CourseActivationDetailsState {}

class CourseActivationDetailsInitial extends CourseActivationDetailsState {}

class CourseActivationDetailsSuccessState
    extends CourseActivationDetailsState {
  final DetailActivationModel detailActivationModel;
  CourseActivationDetailsSuccessState(this.detailActivationModel);
}

class CourseActivationDetailsErrorState extends CourseActivationDetailsState {
  final String error;
  CourseActivationDetailsErrorState(this.error);
}

class CourseActivationDetailsLoadingState
    extends CourseActivationDetailsState {}

class DeleteStudentFromCourseSuccessState
    extends CourseActivationDetailsState {

}

class DeleteStudentFromCourseErrorState extends CourseActivationDetailsState {
  final String error;
  DeleteStudentFromCourseErrorState(this.error);
}

class DeleteStudentFromCourseLoadingState
    extends CourseActivationDetailsState {}
