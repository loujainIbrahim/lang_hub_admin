import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/profile/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel? profileModel;
  void getProfile() {
    emit(ProfileLoadingState());
    DioHelper.getData(url: "academy-admin/profile").then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      print(profileModel);
      emit(ProfileSuccessState());
    }).catchError((onError) {
      emit(ProfileErrorState(onError.toString()));
      print(onError.toString());
    });
  }

}
