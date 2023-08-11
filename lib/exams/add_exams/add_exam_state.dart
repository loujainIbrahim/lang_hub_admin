part of 'add_exam_cubit.dart';

@immutable
abstract class AddExamState {}

class AddExamInitial extends AddExamState {}

class AddExamLoadingState extends AddExamState {}

class AddExamSuccessState extends AddExamState {
  final ResponseAddExamModel responseAddExamModel;
  AddExamSuccessState(this.responseAddExamModel);
}

class AddExamErrorState extends AddExamState {
  String error;
  AddExamErrorState(this.error);
}
