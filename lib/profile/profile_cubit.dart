import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/profile/profile_model.dart';
import 'package:lang_hub_admin/profile/update_profile/update_profile_model.dart';
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
      emit(ProfileSuccessState(profileModel!));
    }).catchError((onError) {
      emit(ProfileErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  UpdateProfileModel? updateProfileModel;
  void updateProfile(
      {String? photo,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? academyName,
      String? location,
      String? newEmail,
      String? description,
      String? licensNum,
      int? english,
      int? germany,
      int? spanish,
      int? french,
      String? image}) {
    final personalInfo = {
      if (photo != null) 'photo': photo,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (phone != null) 'phone_number': phone
    };

    final academyInfo = {
      if (academyName != null) 'name': academyName,
      if (location != null) 'location': location,
      if (description != null) "description": description,
      if (licensNum != null) "license_number": licensNum,
      if (english != null) "english": english,
      if (germany != null) "germany": germany,
      if (spanish != null) "spanish": spanish,
      if (french != null) "french": french,
      if (image != null) "image": image,
    };

    final body = json.encode({
      if (personalInfo.isNotEmpty) 'personal_info': personalInfo,
      if (academyInfo.isNotEmpty) 'academy_info': academyInfo,
      if (newEmail != null) 'email': newEmail,
    });
    emit(UpdateProfileLoadingState());

    DioHelper.postData(url: "academy-admin/profile/update", data: body)
        .then((value) {
      // updateProfileModel = UpdateProfileModel.fromJson(value.data);
      print("updateeee");
      print(json.encode(value.data));
      print(value.data);
      emit(UpdateProfileSuccessState());
      print("Success");
    }).catchError((onError) {
      emit(UpdateProfileErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  void changePassowrd(String oldPassword, String newPassword) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(url: "academy-admin/profile/change-password", data: {
      "current_password": oldPassword,
      "new_password": newPassword
    }).then((value) {
      print(value.data);
      emit(ChangePasswordSuccessState());
    }).catchError((onError) {
      ChangePasswordErrorState(onError.toString());
    });
  }
}
