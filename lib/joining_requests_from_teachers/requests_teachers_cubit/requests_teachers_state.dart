part of 'requests_teachers_cubit.dart';

@immutable
abstract class RequestsTeachersState {}

class RequestsTeachersInitial extends RequestsTeachersState {}

class RequestsTeachersSuccessState extends RequestsTeachersState {
  final RequestsTeachersModel requestsTeachersModel;
  RequestsTeachersSuccessState(this.requestsTeachersModel);
}

class RequestsTeachersErrorState extends RequestsTeachersState {
  final String error;
  RequestsTeachersErrorState(this.error);
}

class RequestsTeachersLoadingState extends RequestsTeachersState {}
class ApproveRequestsTeachersSuccessState extends RequestsTeachersState {
  final ApproveRequestsTeachersModel approveRequestsTeachersModel;
  ApproveRequestsTeachersSuccessState(this.approveRequestsTeachersModel);
}

class ApproveRequestsTeachersErrorState extends RequestsTeachersState {
  final String error;
  ApproveRequestsTeachersErrorState(this.error);
}

class ApproveRequestsTeachersLoadingState extends RequestsTeachersState {}