import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/add_courses/add_course_screen.dart';
import 'package:lang_hub_admin/home/home_screen.dart';
import 'package:lang_hub_admin/languages_and_course/languages_and_courses_cubit.dart';

import '../activate_course/activate_course_screen.dart';
import '../core/color.dart';
import '../core/widgets/elevate_button.dart';
import '../courses activation/course_details_activation/course_details_activation_screen.dart';
import '../exams/add_exams/add_exams_screen.dart';

class LanguagesAndCoursesScreen extends StatefulWidget {
  const LanguagesAndCoursesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesAndCoursesScreen> createState() =>
      _LanguagesAndCoursesScreenState();
}

class _LanguagesAndCoursesScreenState extends State<LanguagesAndCoursesScreen> {
  bool english = true;
  bool spanish = false;
  bool germeny = false;
  bool french = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LanguagesAndCoursesCubit()..GetLanguageAndCourses("english"),
      child: BlocConsumer<LanguagesAndCoursesCubit, LanguagesAndCoursesState>(
        listener: (context, state) {
          // TODO: implement listener
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
                      final LangCoursemodel =
                          LanguagesAndCoursesCubit.get(context)
                              .languageCourseModel;
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // number of columns
                            crossAxisSpacing: 10.0, // spacing between columns
                            mainAxisSpacing: 10.0, // spacing between rows
                          ),
                          itemCount:
                              LangCoursemodel!.data!.length, // number of items
                          itemBuilder: (BuildContext context, int index) {
                            return BuildItemListView(
                                context,
                                LangCoursemodel!.data![index].courseImage!,
                                LangCoursemodel!.data![index].name!,
                                LangCoursemodel!.data![index].hours.toString(),
                            LangCoursemodel!.data![index].id!
                            );
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
      BuildContext context, String image, String name, String hours,int id) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: ScreenUtil().setWidth(281),
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
              width: ScreenUtil().setWidth(281),
              height: ScreenUtil().setHeight(200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                            fontWeight: FontWeight.bold),
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
                            onPressed: () {},
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
                            width: 25,
                            height: 25,
                            backround: mainColor,
                            text: "activate",
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ActivateCourseScreen(id: id,)));
                            })
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
}
