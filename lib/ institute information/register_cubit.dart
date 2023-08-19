import 'dart:html' as html;
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/%20institute%20information/register_model.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
part 'register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
 RegisterModel? registerModel;
  Future<void> userRegister({
    required String first_name,
    required String last_name,
    required String name,
    required String location,
    required int license_number,
    required String description,
    required String email,
    required String phone_number,
    required String password,
    required List<Uint8List> imageList,
    required Uint8List? imageData,
    required List<html.File>? files,
   required  int? eng,
    required  int?  frensh,
    required  int?  germeny,
    required  int?  spanish
  }) async {
    emit(RegisterLoadingState());

    final formData = FormData.fromMap({
      'first_name': first_name,
      'last_name': last_name,
      'name': name,
      'location': location,
      'license_number': license_number.toString(),
      'email': email,
      'password': password,
      'phone_number': phone_number,
      'description': description,
      'english':eng,
      'french':frensh,
      'spanish':spanish,
      'germany':germeny
    });

    if (imageData != null) {
      formData.files.add(MapEntry(
        'photo',
        MultipartFile.fromBytes(imageData, filename: 'photo.jpg'),
      ));
    }

    if (files != null) {
      for (var i = 0; i < files.length; i++) {
        if (imageList[i] != null && files[i] != null && files[i]!.name != null) {
          formData.files.add(MapEntry(
            'photos[]',
            MultipartFile.fromBytes(
              imageList[i]!,
              filename: files[i]!.name!,
            ),
          ));
        }
      }
    }
    DioHelper.postData(
      url: 'academy-admin/register',
      data: formData,
    ).then((value) {
      print(value.data);
      registerModel=RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((onError) {
      emit(RegisterErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}