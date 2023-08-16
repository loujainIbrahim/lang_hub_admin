import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/profile/update_profile/update_profile_model.dart';
import 'package:meta/meta.dart';

import '../../core/shared.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
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
      String? image})  {
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

    DioHelper.postData(url: "academy-admin/profile/update", data: body).then((
        value) {
     // updateProfileModel = UpdateProfileModel.fromJson(json.encode(value.data));
      print("updateeee");
      print(json.encode(value.data));
     // print(value.data);
      emit(UpdateProfileSuccessState());
      print("Success");
    }).catchError((onError) {
      emit(UpdateProfileErrorState(onError.toString()));
      print(onError.toString());
    });
   }


  //
  //
  //
  //
  //   var headers = {
  //     'Authorization': "Bearer "+"$token",
  //     "Content-Type":"application/json",
  //   };
  //   var data = json.encode({
  //     "personal_info": {
  //       "firstName": firstName,
  //       "phone_number": phone
  //     },
  //     "academy_info": {
  //       "name": academyName,
  //       "location": location,
  //       "description": description,
  //       "license_number": "200212",
  //       "english": 0,
  //       "germany": 0,
  //       "spanish": 0,
  //       "french": 0
  //     },
  //     "email": "laujain@gmail.com"
  //   });
  //   var dio = Dio();
  //   emit(UpdateProfileLoadingState());
  //   var response =  dio.request(
  //     'http://localhost:8000/api/academy-admin/profile/update',
  //     options: Options(
  //       method: 'POST',
  //       headers: headers,
  //     ),
  //     data: data,
  //   ).then((value) {
  //     emit(UpdateProfileSuccessState());
  //     if (value.statusCode == 200) {
  //       print(json.encode(value.data));
  //     }
  //     else {
  //       print(value.statusMessage);
  //     }
  //   }).catchError((onError){
  //     emit(UpdateProfileErrorState(onError.toString()));
  //     print(onError.toString());
  //   });
  //
  //
  // }
}
