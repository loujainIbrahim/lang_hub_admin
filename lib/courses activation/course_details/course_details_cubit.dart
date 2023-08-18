import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:meta/meta.dart';

import 'detail_activation_model .dart';

part 'course_details_state.dart';

class CourseActivationDetailsCubit extends Cubit<CourseActivationDetailsState> {
  CourseActivationDetailsCubit() : super(CourseActivationDetailsInitial());
  DetailActivationModel? detailActivationModel;
  static CourseActivationDetailsCubit get(context) => BlocProvider.of(context);
  void getCourseActivationDetails(int id) {
    emit(CourseActivationDetailsLoadingState());
    DioHelper.getData(url: "academy-admin/courses/$id/show").then((value) {
      detailActivationModel = DetailActivationModel.fromJson(value.data);
      emit(CourseActivationDetailsSuccessState(detailActivationModel!));
      //print(value.data);
    }).catchError((onError) {
      emit(CourseActivationDetailsErrorState(onError.toString()));
    });
  }

  void deleteStudentFromCourse(int id) {
    emit(DeleteStudentFromCourseLoadingState());
    DioHelper.deleteData(url: "academy-admin/students/delete/$id")
        .then((value) {
      emit(DeleteStudentFromCourseSuccessState());
      print("thissssssssss delete");
      print(value.data);
    }).catchError((onError) {
      emit(DeleteStudentFromCourseErrorState(onError.toString()));
      print("thissssssssss delete");
      print(onError.toString());
    });
  }
}
