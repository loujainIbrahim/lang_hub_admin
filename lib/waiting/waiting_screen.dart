// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lang_hub_admin/core/color.dart';
// import 'package:lang_hub_admin/home/home_screen.dart';
//
// import 'cubit_waiting/message_cubit.dart';
//
// class WaitingScreen extends StatefulWidget {
//   @override
//   _WaitingScreenState createState() => _WaitingScreenState();
// }
//
// class _WaitingScreenState extends State<WaitingScreen> {
//   bool _isLoading = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => WaitingCubit()..getAccept(),
//       child: Scaffold(
//         body: BlocBuilder<WaitingCubit, WaitingState>(
//           builder: (context, state) {
//             if (state is WaitingInitial) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is AcceptLoadingState) {
//               _isLoading = true;
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is AcceptSuccessState) {
//               if (state.message == 'approved') {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()),
//                 );
//               }
//               _isLoading = false;
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Wait until you are accepted",
//                       style: TextStyle(fontSize: 25, color: mainColor),
//                     ),
//                     Container(
//                       child: Image.asset("assets/images/ll.jpg"),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (state is AcceptErrorState) {
//               _isLoading = false;
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Error: ${state.error}",
//                       style: TextStyle(fontSize: 25, color: mainColor),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.refresh),
//                       onPressed: () {
//                         WaitingCubit().refresh();
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             }
//             return Container();
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             WaitingCubit().refresh();
//           },
//           child: Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }
// }