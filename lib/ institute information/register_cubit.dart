import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister(
      {required String first_name,
      required String last_name,
      required String name,
      required String location,
      required int license_number,
      required String description,
      required String email,
      required String phone_number,
      required String password,
      required String photo,
      required List<String> photos}) async {
    emit(RegisterLoadingState());

    var formData = FormData();
    formData.fields.add(MapEntry("first_name", first_name));
    formData.fields.add(MapEntry("last_name", last_name));
    formData.fields.add(MapEntry("name", name));
    formData.fields.add(MapEntry("location", location));
    formData.fields.add(MapEntry("license_number", license_number.toString()));
    formData.fields.add(MapEntry("email", email));
    formData.fields.add(MapEntry("password", password));
    formData.fields.add(MapEntry("phone_number", phone_number));
    formData.fields.add(MapEntry("photo", photo));
    for (var i = 0; i < photos.length; i++) {
      formData.fields.add(MapEntry("photos[$i]", photos[i]));
    }
    formData.fields.add(MapEntry("description", description));

    // Add multiple photos as form fields

    try {
      var response = await DioHelper.postData(
        url: 'academy-admin/register',
        data: formData,
      );

      print(response.data);

      emit(RegisterSuccessState());
      print("success");
    } catch (error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    }
  }
}
