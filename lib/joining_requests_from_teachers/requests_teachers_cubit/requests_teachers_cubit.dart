import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:meta/meta.dart';

import '../approve_request_teacher_model.dart';
import '../requests_teachers_model.dart';

part 'requests_teachers_state.dart';

class RequestsTeachersCubit extends Cubit<RequestsTeachersState> {
  RequestsTeachersCubit() : super(RequestsTeachersInitial());
  static RequestsTeachersCubit get(context) => BlocProvider.of(context);
  RequestsTeachersModel? requestsTeachersModel;
  ApproveRequestsTeachersModel? approveRequestsTeachersModel;
  void getRequestTeachers() {
    emit(RequestsTeachersLoadingState());
    DioHelper.getData(url: "academy-admin/teachers/requests").then((value) {
      requestsTeachersModel = RequestsTeachersModel.fromJson(value.data);
      emit(RequestsTeachersSuccessState(requestsTeachersModel!));
    }).catchError((onError) {
      emit(RequestsTeachersErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  void approveTeacher(int id) {
    emit(ApproveRequestsTeachersLoadingState());
    DioHelper.getData(url: "academy-admin/teachers/accept-teacher/$id")
        .then((value) {
      approveRequestsTeachersModel =
          ApproveRequestsTeachersModel.fromJson(value.data);
      ApproveRequestsTeachersSuccessState(approveRequestsTeachersModel!);
      print(value.data);
    }).catchError((onError) {
      emit(ApproveRequestsTeachersErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}
