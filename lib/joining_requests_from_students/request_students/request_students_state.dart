part of 'request_students_cubit.dart';

@immutable
abstract class RequestStudentsState {}

class RequestStudentsInitial extends RequestStudentsState {}

class RequestStudentsLoadingState extends RequestStudentsState {}

class RequestStudentsSuccessState extends RequestStudentsState {
  final RequestsStudentModel requestsStudentModel;
  RequestStudentsSuccessState(this.requestsStudentModel);
}

class RequestStudentsErrorState extends RequestStudentsState {
  final String error;
  RequestStudentsErrorState(this.error);
}

class ApproveRequestStudentsLoadingState extends RequestStudentsState {}

class ApproveRequestStudentsSuccessState extends RequestStudentsState {
  final ApproveRequestsStudentsModel approveRequestsStudentsModel;
  ApproveRequestStudentsSuccessState(this.approveRequestsStudentsModel);
}

class ApproveRequestStudentsErrorState extends RequestStudentsState {
  final String error;
  ApproveRequestStudentsErrorState(this.error);
}
