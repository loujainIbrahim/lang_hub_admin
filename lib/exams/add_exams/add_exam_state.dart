part of 'add_exam_cubit.dart';

@immutable
abstract class AddExamState {}

class AddExamInitial extends AddExamState {}

class AddExamLoadingState extends AddExamState {}

class AddExamSuccessState extends AddExamState {

  AddExamSuccessState();
}

class AddExamErrorState extends AddExamState {
  String error;
  AddExamErrorState(this.error);
}
