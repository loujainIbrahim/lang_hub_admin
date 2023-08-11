import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/network/DioHelper.dart';
import 'package:lang_hub_admin/feedback/feedback_model.dart';
import 'package:meta/meta.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(FeedbackInitial());
  FeedbackModel? feedbackModel;
  static FeedbackCubit get(context) => BlocProvider.of(context);
  Future<void> getFeedback() async {
    emit(FeedbackLoadingState());
    await DioHelper.getData(url: "academy-admin/profile/feedback")
        .then((value) {
      feedbackModel=FeedbackModel.fromJson(value.data);
      print(value.data);
      emit(FeedbackSuccessState(feedbackModel!));
    }).catchError((onError) {
      emit(FeedbackErrorState(onError.toString()));
    });
  }
}
