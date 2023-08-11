import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:meta/meta.dart';

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
      required List<String> photos
  }) async {
    emit(RegisterLoadingState());
   await DioHelper.postData(url: 'academy-admin/register', data: {
      "first_name": first_name,
      "last_name": last_name,
      "name": name,
      "location": location,
      "license_number": license_number,
      "description": description,
      "email": email,
      "phone_number": phone_number,
      "password": password,
      "photo": photo,
      "photos": photos
    }).then((value) {
      emit(RegisterSuccessState());
      print("loujain");
      //print(value.data);
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
      print("error");
      print(onError);
    });
  }
}
