// import 'dart:async';
// import 'dart:convert';
// import 'dart:html';
// import 'dart:html' as html;
// import 'dart:typed_data';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lang_hub_admin/add_courses/add_course_cubit.dart';
// import 'package:lang_hub_admin/courses%20activation/course_details/course_details_cubit.dart';
// import 'package:lang_hub_admin/languages_and_course/language_and_courses_model.dart';
// import 'package:lang_hub_admin/languages_and_course/languages_and_courses_cubit.dart';
//
// import '../core/color.dart';
// import '../core/widgets/alert.dart';
// import '../core/widgets/drop_list_item.dart';
// import '../core/widgets/elevate_button.dart';
// import '../core/widgets/field_item_choose.dart';
// import '../core/widgets/snake_bar_widget.dart';
//
// class AddCourseScreen extends StatefulWidget {
//   const AddCourseScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddCourseScreen> createState() => _AddCourseScreenState();
// }
//
// class _AddCourseScreenState extends State<AddCourseScreen> {
//   TextEditingController description = TextEditingController();
//   TextEditingController nameCourse = TextEditingController();
//   TextEditingController numberOfHours = TextEditingController();
//   List<String> _items = [
//     'English',
//     'Spanish',
//     'French',
//     'Germany',
//   ];
//   final List<String> dropdownItems = [
//     'English',
//     'Spanish',
//     'French',
//     'Germany',
//   ];
//   String? selectedDropdownItem;
//   String _base64Image = '';
//   String _selectedItem = 'English';
//   LanguageCourseModel? languageCourseModel;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LanguagesAndCoursesCubit(),
//       child: BlocConsumer<LanguagesAndCoursesCubit, LanguagesAndCoursesState>(
//         listener: (context, state) {
//           if (state is AddCourseError) {
//             print(state.error);
//           } else if (state is AddCourseSuccess) {
//              if(state.message=="the selected value for hours invalid")
//                showAlertDialog(context,state.message);
//            else ErrorSnackBar.show(context, state.message);
//           }
// // TODO: implement listener
//           if (state is AddCourseError) {
//             print(state.error);
//           } else if (state is AddCourseSuccess) {
//
//             Navigator.pop(context);
//             print("is correct");
//           }
//         },
//         builder: (context, state) {
//           final _key = GlobalKey<FormState>();
//           return Scaffold(
//             appBar: AppBar(
//               shape: Border(
//                   bottom: BorderSide(color: mainColor),
//                   top: BorderSide(color: mainColor),
//                   right: BorderSide(color: mainColor),
//                   left: BorderSide(color: mainColor)),
//               elevation: 0,
//               leadingWidth: 200,
//               backgroundColor: fillColorInTextFormField,
//               centerTitle: true,
//               leading: Image.asset(
//                 "assets/images/home_logo.png",
//                 fit: BoxFit.fill,
//               ),
//               title: Text(
//                 "Add course",
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: mainColor),
//               ),
//             ),
//             body: Form(
//               key:_key ,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(top: 10.0, left: 7, bottom: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: ScreenUtil().setWidth(1844),
//                           height: ScreenUtil().setHeight(90),
//                           child: Text(
//                             "You can now add a level to your educational series and add your level information to be fixed,"
//                             "and then you add variable information such as the price, number of seats, start and end date,"
//                             "and add the professor for this show",
//                             style: TextStyle(
//                                 fontSize: ScreenUtil().setSp(30),
//                                 color: mainColor),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 40.0),
//                             child: Container(
//                               width: ScreenUtil().setWidth(547),
//                               height: ScreenUtil().setHeight(390),
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.grey,
//                                   width: 1.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: (_imageData != null)
//                                     ? Container(
//                                         width: 200,
//                                         height: 200,
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                             image: MemoryImage(_imageData!),
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       )
//                                     : Center(
//                                         child: IconButton(
//                                           icon: Icon(
//                                             Icons.add_a_photo,
//                                             size: 30,
//                                             color: mainColor,
//                                           ),
//                                           onPressed: _pickImage,
//                                         ),
//                                       ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(top: 20),
//                             child: Text(
//                               "Description:",
//                               style: TextStyle(
//                                 fontSize:
//                                     ScreenUtil().setSp(25), // smaller font size
//                                 color: mainColor,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4),
//                             child: ItemField(
//                                 h: 100, controller: description, ontap: () {}),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 60.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "name course:",
//                                   style: TextStyle(
//                                     fontSize: ScreenUtil()
//                                         .setSp(25), // smaller font size
//                                     color: mainColor,
//                                   ),
//                                 ),
//                                 ItemField(controller: nameCourse, ontap: () {}),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 60.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "number of hours:",
//                                   style: TextStyle(
//                                     fontSize: ScreenUtil()
//                                         .setSp(25), // smaller font size
//                                     color: mainColor,
//                                   ),
//                                 ),
//                                 ItemField(
//                                     controller: numberOfHours, ontap: () {}),
//                               ],
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "choose  language:",
//                                 style: TextStyle(
//                                   fontSize:
//                                       ScreenUtil().setSp(25), // smaller font size
//                                   color: mainColor,
//                                 ),
//                               ),
//                               DropdownButtonWidget(
//                                 items: dropdownItems,
//                                 selectedItem: selectedDropdownItem,
//                                 onChanged: (String? selectedItem) {
//                                   selectedDropdownItem = selectedItem;
//                                   print('Selected item: $selectedItem');
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, bottom: 20.0),
//                     child: ConditionalBuilder(
//                       condition: state is! AddCourseLoading,
//                       fallback: (context) => CircularProgressIndicator(),
//                       builder: (context) => elevate_button(
//                           width: 305,
//                           height: 65,
//                           backround: mainColor,
//                           text: 'Add', function: () {  },
//                           // function: () async {
//                           //   var num = int.parse(numberOfHours.text);
//                           //   print(nameCourse.text);
//                           //   print(description.text);
//                           //   print(num);
//                           //   print(selectedDropdownItem);
//                           //   print(_pickedFile);
//                           //   // print(_imageData);
//                           //  if (_key!.currentState!.validate())  {
//                           //     LanguagesAndCoursesCubit.get(context).AddCourse(
//                           //       name: nameCourse.text,
//                           //       description: description.text,
//                           //       hours: num,
//                           //       language: selectedDropdownItem!,
//                           //       course_image: _pickedFile!,
//                           //       pickedFile: _pickedFile!,
//                           //       imageData: _imageData,
//                           //     );
//                           //   }
//                           // }
//                         ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   html.File? _pickedFile;
//   Uint8List? _imageData;
//   void _pickImage() async {
//     final input = html.FileUploadInputElement();
//     input.accept = 'image/';
//     input.click();
//     await input.onChange.first;
//     _pickedFile = input.files!.first;
//     final reader = html.FileReader();
//     reader.readAsArrayBuffer(_pickedFile!);
//     reader.onLoadEnd.listen((event) {
//       setState(() {
//         _imageData = reader.result as Uint8List?;
//       });
//     });
//   }
//
//   Future<String> getImageAsBase64() async {
//     final completer = Completer<String>();
//     final input = html.FileUploadInputElement();
//     input.accept = 'image/';
//     input.onChange.listen((event) {
//       final file = input.files!.first;
//       final reader = html.FileReader();
//       reader.readAsDataUrl(file);
//       reader.onLoad.listen((event) {
//         final encoded = reader.result as String;
//         completer.complete(
//             encoded.replaceFirst(RegExp('data:image/[^;]+;base64,'), ''));
//       });
//     });
//     input.click();
//     return completer.future;
//   }
// }
