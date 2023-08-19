part of 'offer_cubit.dart';

@immutable
abstract class OfferState {}

class OfferInitial extends OfferState {}
class OfferSuccessState extends OfferState {
 OfferModel offerModel;
 OfferSuccessState(this.offerModel);
}
class OfferLoadingState extends OfferState {}
class OfferErrorState extends OfferState {
 final String  error;
 OfferErrorState(this.error);
}