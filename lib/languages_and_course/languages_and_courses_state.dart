part of 'languages_and_courses_cubit.dart';

@immutable
abstract class LanguagesAndCoursesState {}

class LanguagesAndCoursesInitial extends LanguagesAndCoursesState {}
class LanguagesAndCoursesSuccessState extends LanguagesAndCoursesState {}
class LanguagesAndCoursesErrorState extends LanguagesAndCoursesState {
  final String error;
  LanguagesAndCoursesErrorState(this.error);
}
class LanguagesAndCoursesLoadingState extends LanguagesAndCoursesState {

}
