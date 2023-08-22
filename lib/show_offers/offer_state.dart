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
class AddOfferLoading extends OfferState{}
class AddOfferSuccess extends OfferState{

 AddOfferSuccess();
}
class AddOfferError extends OfferState{
 final String error;
 AddOfferError(this.error);
}

class DeleteOfferLoading extends OfferState{}
class DeleteOfferSuccess extends OfferState{
final String message;
 DeleteOfferSuccess(this.message);
}
class DeleteOfferError extends OfferState{
 final String error;
 DeleteOfferError(this.error);
}