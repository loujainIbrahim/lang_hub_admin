import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/home/models/student_model.dart';
import 'package:lang_hub_admin/home/models/teachers_model.dart';
import 'package:meta/meta.dart';
import '../../courses activation/courses_activation_screen.dart';
import '../../display_students/students_screen.dart';
import '../../feedback/feedback_screen.dart';
import '../../joining_requests_from_students/joining_requests_from_students_screen.dart';
import '../../joining_requests_from_teachers/joining_requests_from_teachers_screen.dart';
import '../../languages_and_course/languages_and_courses_screen.dart';
import '../../show_offers/show_offers_screen.dart';
import '../../teachers/teachers_screen.dart';
import '../../update_time_ the_wait/update_time_ the_wait_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  StudentsModel? studentsModel;
  TeachersModel? teachersModel;
  List<Widget> SideBarScreens = [
    StudnetScreen(),
    TeachersScreen(),
    LanguagesAndCoursesScreen(),
    CoursesActivationScreen(),
    JoiningRequestsScreen(),
    JoiningRequestsStudentsScreen(),
    ShowOffersScreen(),
    FeedBackScreen(),
    UpdateTimeTheWaitScreen(),
  ];
  List<String> pageTitles = [
    'Students',
    'Teachers',
    'Languages and courses',
    'courses activation',
    'joining requests from teachers',
    'joining requests from students',
    'Offers',
    'Feedback',
    'Update time the wait',
  ];
  void changeSideBar(int index) {
    currentIndex = index;

    emit(ChangeSideBarItem());
  }

  void getSudents() {
    emit(HomeLoadingState());
    DioHelper.getData(url: "academy-admin/students/").then((value) {
      studentsModel = StudentsModel.fromJson(value.data);
      print(value.data);
      emit(HomeSuccessState());
    }).catchError((onError) {
      emit(HomeErrorState());
    });
  }

  void addStudentsToCourse(int CourseId, int StudentId) {
    emit(AddStudentLoadingState());
    DioHelper.getData(
            url:
                "academy-admin/courses/addStudentToCourse/$CourseId/$StudentId")
        .then((value) {
      print(value.data);
      emit(AddStudentSuccessState());
    }).catchError((onError) {
      emit(AddStudentErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  void getTeachers() {
    emit(TeachersLoadingState());
    DioHelper.getData(url: 'academy-admin/teachers/').then((value) {
      teachersModel = TeachersModel.fromJson(value.data);
      print(value.data);
      emit(TeachersSuccessState());
    }).catchError((onError) {
      emit(TeacherErrorState(onError.toString()));
    });
  }
}
