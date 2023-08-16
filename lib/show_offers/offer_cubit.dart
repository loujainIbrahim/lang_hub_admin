import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        emit(OfferSuccessState());
        // Rest of your code
      } else {
        // Handle the case when value.data is null
      }
    }).catchError((onError) {
      emit(OfferErrorState(onError.toString()));
      print(onError.toString());
    });
  }
}
