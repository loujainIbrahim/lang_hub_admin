part of 'feedback_cubit.dart';

@immutable
abstract class FeedbackState {}

class FeedbackInitial extends FeedbackState {}
class FeedbackLoadingState extends FeedbackState {}
class FeedbackSuccessState extends FeedbackState {
  final FeedbackModel feedbackModel;
  FeedbackSuccessState(this.feedbackModel);
}
class FeedbackErrorState extends FeedbackState {
  final String error;
  FeedbackErrorState(this.error);
}
