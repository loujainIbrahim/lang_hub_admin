import 'dart:js';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/widgets/snake_bar_widget.dart';
import 'package:lang_hub_admin/courses%20activation/active_course_cubit.dart';
import 'package:lang_hub_admin/courses%20activation/show_exam/show_exam_screen.dart';
import 'package:lang_hub_admin/teachers/teacherDetails/teacher_details_screen.dart';

import '../core/color.dart';
import '../core/widgets/alert.dart';
import '../core/widgets/elevate_button.dart';
import '../exams/add_exams/add_exams_screen.dart';
import 'course_details/course_details_screen.dart';
import 'course_details_activation/course_details_activation_screen.dart';

class CoursesActivationScreen extends StatefulWidget {
  const CoursesActivationScreen({Key? key}) : super(key: key);

  @override
  State<CoursesActivationScreen> createState() =>
      _CoursesActivationScreenState();
}

class _CoursesActivationScreenState extends State<CoursesActivationScreen> {
  bool english = true;
  bool spanish = false;
  bool germeny = false;
  bool french = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActiveCourseCubit, ActiveCourseState>(
      listener: (context, state) {
        if (state is DeleteExamSuccessState) {
          ErrorSnackBar.show(context, state.message);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
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
                          print(english);
                          print(french);
                          ActiveCourseCubit.get(context)
                              .getActiveCourses("english");
                        }),
                    elevate_button(
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
                        ActiveCourseCubit.get(context)
                            .getActiveCourses("spanish");
                      },
                      backround: spanish ? mainColor : ff5C3A81,
                    ),
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
                          ActiveCourseCubit.get(context)
                              .getActiveCourses("germany");
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
                          ActiveCourseCubit.get(context)
                              .getActiveCourses("french");
                        }),
                  ],
                ),
              ),
              ConditionalBuilder(
                  condition: state is! ActiveCourseLoadingState,
                  fallback: (context) => Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  builder: (context) {
                    final activate_model =
                        ActiveCourseCubit.get(context).activateCourseModel;
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // number of columns
                          crossAxisSpacing: 5.0, // spacing between columns
                          mainAxisSpacing: 5.0,
                          // spacing between rows
                        ),
                        itemCount:
                            activate_model!.data!.length, // number of items
                        itemBuilder: (BuildContext context, int index) {
                          return BuildItemListView(
                              context,
                              activate_model!.data![index].id!,
                              activate_model!.data![index].courseImage!,
                              activate_model.data![index].name!,
                              "loujain",
                              activate_model.data![index].price!,
                              "10",
                              activate_model.data![index].seats!,
                              activate_model.data![index].startDate!,
                              activate_model.data![index].endDate!,
                              activate_model.data![index].hasExam!);
                        },
                      ),
                    );
                  })
            ],
          ),
        );
      },
    );
  }

  Widget BuildItemListView(
      BuildContext context,
      int id,
      String? image,
      String name,
      String given,
      int price,
      String num,
      int seats,
      String start,
      String end,
      int hasExam) {
    String numberString = price.toString();
    String seats = price.toString();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetailsScreen(id: id)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: fillColorInTextFormField,
        ),
        height: 200,
        width: 200,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  child: (image == "" || image == null)
                      ? Container(
                          color: Colors.blue,
                        )
                      : Image.network(
                          image!,
                          fit: BoxFit.cover,
                        )),
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(22), // smaller font size
                  color: mainColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "given by " + given,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(22), // smaller font size
                color: mainColor,
              ),
            ),
            Text(
              numberString + " s.p",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(22), // smaller font size
                color: mainColor,
              ),
            ),
            Text(
              "number of students: " + num,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(22), // smaller font size
                  color: mainColor),
            ),
            Text(
              "number of seats: " + seats,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(22), // smaller font size
                  color: mainColor),
            ),
            Row(
              children: [
                Text(
                  "start " + start,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(22), // smaller font size
                    color: mainColor,
                  ),
                ),
                Text(
                  "end " + end,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(22), // smaller font size
                    color: mainColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (hasExam == 0)
                    ? elevate_button(
                        fontSizeText: 14,
                        radius: 10,
                        width: 14,
                        height: 40,
                        backround: mainColor,
                        text: "add exam",
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddExamsScreen(
                                        id: id,
                                      )));
                        })
                    : elevate_button(
                        fontSizeText: 14,
                        radius: 10,
                        width: 14,
                        height: 40,
                        backround: ff5C3A81,
                        text: "add exam",
                        function: () {}),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: elevate_button(
                      fontSizeText: 14,
                      radius: 10,
                      width: 14,
                      height: 40,
                      backround: mainColor,
                      text: "show exam",
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionsScreen(id)));
                      }),
                ),
              ],
            ),
            (hasExam == 0)
                ? elevate_button(
                    fontSizeText: 14,
                    radius: 10,
                    width: 14,
                    height: 40,
                    backround:ff5C3A81 ,
                    text: "delete exam",
                    function: () {
                      showAlertDialog(
                          context, "thers is no exam in this course");
                    })
                : elevate_button(
                    fontSizeText: 14,
                    radius: 10,
                    width: 14,
                    height: 40,
                    backround: ff5C3A81,
                    text: "delete exam",
                    function: () {
                      ActiveCourseCubit.get(context).deleteExam(id);
                    }),
          ],
        ),
      ),
    );
  }
}
