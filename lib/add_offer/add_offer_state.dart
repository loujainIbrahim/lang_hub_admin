part of 'add_offer_cubit.dart';

@immutable
abstract class AddOfferState {}

class AddOfferInitial extends AddOfferState {}
class AddOfferLoading extends AddOfferState{}
class AddOfferSuccess extends AddOfferState{

  AddOfferSuccess();
}
class AddOfferError extends AddOfferState{
  final String error;
  AddOfferError(this.error);
}