part of 'show_exam_cubit.dart';

@immutable
abstract class ShowExamState {}

class ShowExamInitial extends ShowExamState {}
class ShowExamLoadingState extends ShowExamState {}
class ShowExamSuccessState extends ShowExamState {
  final ShowExamModel showExamModel;
  ShowExamSuccessState(this.showExamModel);
}
class ShowExamErrorState extends ShowExamState {
  final String error;
  ShowExamErrorState(this.error);
}