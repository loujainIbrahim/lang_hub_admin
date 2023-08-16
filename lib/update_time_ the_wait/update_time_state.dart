part of 'update_time_cubit.dart';

@immutable
abstract class UpdateTimeState {}

class UpdateTimeInitial extends UpdateTimeState {}
class UpdateTimeSuccessState extends UpdateTimeState{}
class UpdateTimeLoadingState extends UpdateTimeState{}
class UpdateTimeErrorState extends UpdateTimeState{
 final  String error;
  UpdateTimeErrorState(this.error);
}