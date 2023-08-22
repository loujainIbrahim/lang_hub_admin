import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:lang_hub_admin/languages_and_course/language_and_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/add_courses/add_course_cubit.dart';
import 'package:lang_hub_admin/add_courses/add_course_screen.dart';
import 'package:lang_hub_admin/home/home_screen.dart';
import 'package:lang_hub_admin/languages_and_course/languages_and_courses_cubit.dart';

import '../activate_course/activate_course_screen.dart';
import '../core/color.dart';
import '../core/widgets/drop_list_item.dart';
import '../core/widgets/elevate_button.dart';
import '../core/widgets/field_item_choose.dart';
import '../courses activation/course_details_activation/course_details_activation_screen.dart';
import '../courses activation/show_exam/show_exam_screen.dart';
import '../exams/add_exams/add_exams_screen.dart';
import 'add_course/add_course_cubit.dart';
import 'add_course/add_course_screen.dart';
import 'language_and_courses_model.dart';

class LanguagesAndCoursesScreen extends StatefulWidget {
  LanguagesAndCoursesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesAndCoursesScreen> createState() =>
      _LanguagesAndCoursesScreenState();
}

class _LanguagesAndCoursesScreenState extends State<LanguagesAndCoursesScreen> {
  bool english = true;
  bool spanish = false;
  bool germeny = false;
  bool french = false;
  LanguageCourseModel? languageCourseModel;
  TextEditingController description = TextEditingController();
  TextEditingController nameCourse = TextEditingController();
  TextEditingController numberOfHours = TextEditingController();
  List<String> _items = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  final List<String> dropdownItems = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  String? selectedDropdownItem;
  String _base64Image = '';
  String _selectedItem = 'English';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // BlocProvider(create: (_) => LanguagesAndCoursesCubit()..GetLanguageAndCourses("english")),

      create: (BuildContext context) =>
          LanguagesAndCoursesCubit()..GetLanguageAndCourses("english"),
      child: BlocConsumer<LanguagesAndCoursesCubit, LanguagesAndCoursesState>(
        listener: (context, state) {
          if (state is DeleteCoursesSuccessState) {
            print("this is come from delete");
            LanguagesAndCoursesCubit.get(context)
                .GetLanguageAndCourses("english");
          }
          if (state is AddCourseSuccess) {
            print("this is come from adddd");
            LanguagesAndCoursesCubit.get(context)
                .GetLanguageAndCourses('english');
          }
          if (state is LanguagesAndCoursesSuccessState)
            languageCourseModel = state.languageCourseModel;
          print("languageCourseModel = state.languageCourseModel");
          // TODO: implement listene
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: mainColor,
              // isExtended: true,
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCourseScreen()));
              },
              child: Icon(
                Icons.add_circle_outline,
                size: 40,
              ),
              // add some space between the icon and the text
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      elevate_button(
                          width: 238,
                          height: 54,
                          backround: english ? mainColor : ff5C3A81,
                          text: "English",
                          function: () {
                            setState(() {
                              english = true;
                              french = false;
                              germeny = false;
                              spanish = false;
                            });
                            LanguagesAndCoursesCubit.get(context)
                                .GetLanguageAndCourses("english");
                          }),
                      elevate_button(
                          backround: spanish ? mainColor : ff5C3A81,
                          text: "Spanish",
                          function: () {
                            setState(() {
                              english = false;
                              french = false;
                              germeny = false;
                              spanish = true;
                            });
                            print(english);
                            print(french);
                            print(spanish);
                            LanguagesAndCoursesCubit.get(context)
                                .GetLanguageAndCourses("spanish");
                          }),
                      elevate_button(
                          backround: germeny! ? mainColor : ff5C3A81,
                          text: "germany",
                          function: () {
                            setState(() {
                              english = false;
                              french = false;
                              germeny = true;
                              spanish = false;
                            });
                            LanguagesAndCoursesCubit.get(context)
                                .GetLanguageAndCourses("germany");
                          }),
                      elevate_button(
                          backround: french! ? mainColor : ff5C3A81,
                          text: "french",
                          function: () {
                            setState(() {
                              english = false;
                              french = true;
                              germeny = false;
                              spanish = false;
                            });
                            LanguagesAndCoursesCubit.get(context)
                                .GetLanguageAndCourses("french");
                          }),
                    ],
                  ),
                ),
                ConditionalBuilder(
                    condition: state is! LanguagesAndCoursesLoadingState,
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                    builder: (context) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // number of columns
                            crossAxisSpacing: 10.0, // spacing between columns
                            mainAxisSpacing: 10.0, // spacing between rows
                          ),
                          itemCount: languageCourseModel!
                              .data!.length, // number of items
                          itemBuilder: (BuildContext context, int index) {
                            return BuildItemListView(
                                context,
                                languageCourseModel!.data![index].courseImage!,
                                languageCourseModel!.data![index].name!,
                                languageCourseModel!.data![index].hours
                                    .toString(),
                                languageCourseModel!.data![index].id!);
                          },
                        ),
                      );
                    })
              ],
            ),
          );
        },
      ),
    );
  }

  Widget BuildItemListView(
      BuildContext context, String image, String name, String hours, int id) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: ScreenUtil().setWidth(381),
        height: ScreenUtil().setHeight(243),
        decoration: BoxDecoration(
          color: fillColorInTextFormField,
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(38.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              width: double.infinity,
              height: ScreenUtil().setHeight(180),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  child: (image == "")
                      ? Container(
                          color: Colors.blue,
                        )
                      : Image.network(
                          image!,
                          fit: BoxFit.cover,
                        )),
            ),
            Container(
              width: ScreenUtil().setWidth(381),
              height: ScreenUtil().setHeight(200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize:
                                  ScreenUtil().setSp(25), // smaller font size
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        hours + " hours",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(23), // smaller font size
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              print(id);
                              LanguagesAndCoursesCubit.get(context)
                                  .DeleteCourse(id);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: mainColor,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        elevate_button(
                            fontSizeText: 14,
                            radius: 25,
                            width: 30,
                            height: 25,
                            backround: mainColor,
                            text: "activate",
                            function: () {
                              Future.delayed(Duration.zero, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            ActivateCourseScreen(id: id)));
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 12),
                          child: elevate_button(
                              fontSizeText: 14,
                              radius: 25,
                              width: 20,
                              height: 25,
                              backround: mainColor,
                              text: "delete exam",
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ActivateCourseScreen(id: id)));
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  html.File? _pickedFile;
  Uint8List? _imageData;
  void _pickImage() async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/';
    input.click();
    await input.onChange.first;
    _pickedFile = input.files!.first;
    final reader = html.FileReader();
    reader.readAsArrayBuffer(_pickedFile!);
    reader.onLoadEnd.listen((event) {
      setState(() {
        _imageData = reader.result as Uint8List?;
      });
    });
  }

  Future<String> getImageAsBase64() async {
    final completer = Completer<String>();
    final input = html.FileUploadInputElement();
    input.accept = 'image/';
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = html.FileReader();
      reader.readAsDataUrl(file);
      reader.onLoad.listen((event) {
        final encoded = reader.result as String;
        completer.complete(
            encoded.replaceFirst(RegExp('data:image/[^;]+;base64,'), ''));
      });
    });
    input.click();
    return completer.future;
  }
}
