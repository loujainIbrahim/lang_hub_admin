// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../core/network/DioHelper.dart';
//
// part 'message_state.dart';
//
// class WaitingCubit extends Cubit<WaitingState> {
//   WaitingCubit() : super(WaitingInitial());
//
//   static WaitingCubit get(context) => BlocProvider.of(context);
//
//   String? message;
//
//   void getAccept() {
//     emit(AcceptLoadingState());
//     DioHelper.getData(url: "academy-admin/profile/accepted").then((value) {
//       message = value.data["message"];
//       print(message);
//       emit(AcceptSuccessState(value.data["message"]));
//     }).catchError((onError) {
//       emit(AcceptErrorState(onError.toString()));
//     });
//   }
//
//   void refresh() {
//     emit(WaitingInitial());
//     getAccept();
//   }
// }