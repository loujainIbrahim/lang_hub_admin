import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/show_offers/offer_model.dart';
import 'package:meta/meta.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit() : super(OfferInitial());
  OfferModel? offerModel;
  static OfferCubit get(context) => BlocProvider.of(context);
  void getOffers() {
    emit(OfferLoadingState());
    DioHelper.getData(url: "/academy-admin/offers").then((value) {
      if (value.data != null) {
        offerModel = OfferModel.fromJson(value.data!);
        emit(OfferSuccessState(offerModel!));
        // Rest of your code
      } else {
        // Handle the case when value.data is null
      }
    }).catchError((onError) {
      emit(OfferErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  void AddOffer(
      {required Uint8List? imageData,
      required String description,
      required String name,
      required int hours,
      required int sets,
      // required String language,
      required DateTime startDate,
      required DateTime endDate,
      required int price,
      required int teacher_id,
      required int sat,
      required String sat1,
      required String sat2,
      required int sun,
      required String sun1,
      required String sun2,
      required int mon,
      required String mon1,
      required String mon2,
      required int tues,
      required String tues1,
      required String tues2,
      required int wedns,
      required String wedns1,
      required String wedns2,
      required int thurs,
      required String thurs1,
      required String thurs2,
      required int fri,
      required String fri1,
      required String fri2}) {
    emit(AddOfferLoading());
    final formData = FormData.fromMap({
      'name': name,
      "price": price,
      'hours': hours,
      "start_date": DateFormat('yyyy-MM-dd').format(startDate),
      "end_date": DateFormat('yyyy-MM-dd').format(endDate),
      'description': description,
      "seats": sets,
      "teacher_id": 2,
      "saturday": sat,
      "start_saturday": sat1,
      "end_saturday": sat2,
      "sunday": sun,
      "start_sunday": sun1,
      "end_sunday": sun2,
      "monday": mon,
      "start_monday": mon1,
      "end_monday": mon2,
      "tuesday": tues,
      "start_tuesday": tues1,
      "end_tuesday": tues2,
      "wednsday": wedns,
      "start_wednsday": wedns1,
      "end_wednsday": wedns2,
      "thursday": thurs,
      "start_thursday": thurs1,
      "end_thursday": thurs2,
      "friday": fri,
      "start_friday": fri1,
      "end_friday": fri2
    });
    if (imageData != null) {
      formData.files.add(MapEntry(
        'image',
        MultipartFile.fromBytes(imageData, filename: 'photo.jpg'),
      ));
    }
    DioHelper.postData(url: "academy-admin/offers/add", data: formData)
        .then((value) {
      emit(AddOfferSuccess());
    }).catchError((onError) {
      emit(AddOfferError(onError.toString()));
      print(onError.toString());
    });
  }
 void deleteOffer(int id){
    emit(DeleteOfferLoading());
    DioHelper.deleteData(url: "academy-admin/offers/deleteOffer/$id").then((value) {
      String message=value.data["message"];
      emit(DeleteOfferSuccess(message));
    }).catchError((onError){
      emit(DeleteOfferError(onError.toString()));
    });
 }
  void refreshOffers() {
    getOffers();
  }
}
