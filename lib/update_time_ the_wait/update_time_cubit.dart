import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:meta/meta.dart';

part 'update_time_state.dart';

class UpdateTimeCubit extends Cubit<UpdateTimeState> {
  UpdateTimeCubit() : super(UpdateTimeInitial());
  static UpdateTimeCubit get(context) => BlocProvider.of(context);
  void UpdateTime({required String number}) {
    emit(UpdateTimeLoadingState());
    DioHelper.postData(
        url: "academy-admin/profile/update-requestTime",
        data: {"request_time": number}).then((value) {
      emit(UpdateTimeSuccessState());
    }).catchError((onError) {
      emit(UpdateTimeErrorState(onError.toString()));
    });
  }
}
