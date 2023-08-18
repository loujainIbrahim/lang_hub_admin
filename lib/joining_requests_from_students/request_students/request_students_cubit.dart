import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/joining_requests_from_students/requests_students_model.dart';
import 'package:meta/meta.dart';

import '../approve_student_model.dart';

part 'request_students_state.dart';

class RequestStudentsCubit extends Cubit<RequestStudentsState> {
  RequestStudentsCubit() : super(RequestStudentsInitial());
  RequestsStudentModel? requestsStudentModel;
  ApproveRequestsStudentsModel? approveRequestsStudentsModel;
  static RequestStudentsCubit get(context) => BlocProvider.of(context);
  void getRequestsStudents() {
    emit(RequestStudentsLoadingState());
    DioHelper.getData(url: "academy-admin/students/requests").then((value) {
      requestsStudentModel = RequestsStudentModel.fromJson(value.data);
      emit(RequestStudentsSuccessState(requestsStudentModel!));
    }).catchError((onError) {
      emit(RequestStudentsErrorState(onError.toString()));
    });
  }
  void approveStudent(int id){
    emit(ApproveRequestStudentsLoadingState());
    DioHelper.getData(url: "academy-admin/students/accept-student/$id").then((value) {
      approveRequestsStudentsModel=ApproveRequestsStudentsModel.fromJson(value.data);
      print("this is approve studenttttt"+value.data);
      emit(ApproveRequestStudentsSuccessState(approveRequestsStudentsModel!));
    }
    ).catchError((onError){
      emit(ApproveRequestStudentsErrorState(onError.toString()));
    });
  }
}
