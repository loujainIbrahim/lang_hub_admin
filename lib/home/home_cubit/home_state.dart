part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ChangeSideBarItem extends HomeState{}
class IsSelectedBarItem extends HomeState{}
class HomeSuccessState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeErrorState extends HomeState {}
class TeachersLoadingState extends HomeState {}
class TeachersSuccessState extends HomeState {}
class TeacherErrorState extends HomeState {
  final String error;
  TeacherErrorState(this.error);
}
