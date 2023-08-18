import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/widgets/snake_bar_widget.dart';
import 'package:lang_hub_admin/courses%20activation/course_details/course_details_cubit.dart';
import 'package:lang_hub_admin/courses%20activation/course_details/detail_activation_model%20.dart';
import 'package:lang_hub_admin/display_students/students_screen.dart';
import 'package:lang_hub_admin/languages_and_course/languages_and_courses_cubit.dart';
import 'package:lang_hub_admin/teachers/teachers_screen.dart';

import '../../core/color.dart';
import '../../core/widgets/days_times_widget.dart';
import '../../core/widgets/elevate_button.dart';

class CourseDetailsScreen extends StatefulWidget {
  final int id;

  const CourseDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  // DetailActivationModel? detailModel;
  late CourseActivationDetailsCubit _courseActivationDetailsCubit;
  @override
  void initState() {
    super.initState();
    _courseActivationDetailsCubit = CourseActivationDetailsCubit();
    _courseActivationDetailsCubit.getCourseActivationDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(color: mainColor),
            top: BorderSide(color: mainColor),
            right: BorderSide(color: mainColor),
            left: BorderSide(color: mainColor)),
        elevation: 0,
        leadingWidth: 200,
        backgroundColor: fillColorInTextFormField,
        centerTitle: true,
        leading: Image.asset(
          "assets/images/home_logo.png",
          fit: BoxFit.fill,
        ),
        title: Text(
          "Course details",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
        ),
      ),
      body: BlocProvider(
        create: (context) => _courseActivationDetailsCubit,
        child: BlocConsumer<CourseActivationDetailsCubit,
            CourseActivationDetailsState>(
          listener: (context, state) {
            if (state is DeleteStudentFromCourseSuccessState) {
              ErrorSnackBar.show(context, "delete successfully");
              _courseActivationDetailsCubit
                  .getCourseActivationDetails(widget.id);
              // detailModel = CourseActivationDetailsCubit.get(context)
              //     .detailActivationModel;
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is CourseActivationDetailsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is CourseActivationDetailsSuccessState) {
              {
                final detailModel = state.detailActivationModel;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: ScreenUtil().setWidth(407),
                              height: ScreenUtil().setHeight(380),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(38),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(38),
                                child: Image.network(
                                  detailModel!.data!.courseImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "given by " +
                                            "${detailModel!.data!.teacher!.firstName}" +
                                            "${detailModel!.data!.teacher!.lastName}",
                                        style: TextStyle(
                                            fontSize: 35.sp,
                                            fontWeight: FontWeight.bold,
                                            color: mainColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TeachersScreen()));
                                          },
                                          icon: Icon(Icons.edit)),
                                    ],
                                  ),
                                ),
                                Text(
                                  detailModel!.data!.name!,
                                  style: TextStyle(
                                      fontSize: 31.sp,
                                      fontWeight: FontWeight.bold,
                                      color: mainColor),
                                ),
                                Text(
                                  "${detailModel!.data!.price!}",
                                  style: TextStyle(
                                      fontSize: 31.sp,
                                      fontWeight: FontWeight.bold,
                                      color: mainColor),
                                ),
                                Text(
                                  "${detailModel!.data!.hours!}",
                                  style: TextStyle(
                                      fontSize: 31.sp,
                                      fontWeight: FontWeight.bold,
                                      color: mainColor),
                                ),
                                Text(
                                  "${detailModel!.data!.seats!}",
                                  style: TextStyle(
                                      fontSize: 31.sp,
                                      fontWeight: FontWeight.bold,
                                      color: mainColor),
                                ),
                              ],
                            ),
                            Container(
                              width: 373.w,
                              height: 380.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 90.0),
                                        child: Text("from:"),
                                      ),
                                      Text("to:"),
                                    ],
                                  ),
                                  Expanded(
                                    child:
                                        ListView(shrinkWrap: true, children: [
                                      DaysTimesWidget(
                                          "Saterday",
                                          (detailModel!.data!.annualSchedule![0]
                                                      .saturday ==
                                                  1)
                                              ? true
                                              : false,
                                          detailModel!.data!.annualSchedule![0]
                                              .startSaturday!,
                                          detailModel!.data!.annualSchedule![0]
                                              .endSaturday!),
                                      DaysTimesWidget(
                                          "Sunday",
                                          (detailModel!.data!.annualSchedule![0]
                                                      .sunday ==
                                                  1)
                                              ? true
                                              : false,
                                          detailModel!.data!.annualSchedule![0]
                                              .startSunday!,
                                          detailModel!.data!.annualSchedule![0]
                                              .endSunday!),
                                      DaysTimesWidget(
                                          "Monday",
                                          (detailModel!.data!.annualSchedule![0]
                                                      .monday ==
                                                  1)
                                              ? true
                                              : false,
                                          detailModel!.data!.annualSchedule![0]
                                              .startMonday!,
                                          detailModel!.data!.annualSchedule![0]
                                              .endMonday!),
                                      DaysTimesWidget(
                                          "Tuesday",
                                          (detailModel!.data!.annualSchedule![0]
                                                      .tuesday ==
                                                  1)
                                              ? true
                                              : false,
                                          detailModel!.data!.annualSchedule![0]
                                              .startTuesday!,
                                          detailModel!.data!.annualSchedule![0]
                                              .endTuesday!),
                                      DaysTimesWidget(
                                          "Wednesday",
                                          (detailModel!.data!.annualSchedule![0]
                                                      .wednsday ==
                                                  1)
                                              ? true
                                              : false,
                                          detailModel!.data!.annualSchedule![0]
                                              .startWednsday!,
                                          detailModel!.data!.annualSchedule![0]
                                              .endWednsday!),
                                      DaysTimesWidget(
                                          "Thursday",
                                          (detailModel!.data!.annualSchedule![0]
                                                      .thursday ==
                                                  1)
                                              ? true
                                              : false,
                                          detailModel!.data!.annualSchedule![0]
                                              .startThursday!,
                                          detailModel!.data!.annualSchedule![0]
                                              .endThursday!),
                                      DaysTimesWidget(
                                          "Friday",
                                          (detailModel!.data!.annualSchedule![0]
                                                      .friday ==
                                                  1)
                                              ? true
                                              : false,
                                          detailModel!.data!.annualSchedule![0]
                                              .startFriday!,
                                          detailModel!.data!.annualSchedule![0]
                                              .endFriday!),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 50.0, top: 8, bottom: 8),
                              child: elevate_button(
                                  width: 257,
                                  height: 66,
                                  backround: mainColor,
                                  text: "add student",
                                  function: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StudnetScreen(
                                                  id: detailModel!.data!.id,
                                                )));
                                  }),
                            ),
                          ],
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 493 / 162,
                            crossAxisCount: 2, // number of columns
                          ),
                          itemCount: detailModel!
                              .data!.students!.length, // number of items
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              child: Container(
                                width: ScreenUtil().setWidth(493),
                                height: ScreenUtil().setHeight(150),
                                decoration: BoxDecoration(
                                  color: fillColorInTextFormField,
                                  border: Border.all(
                                    color: mainColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // width: ScreenUtil().setWidth(245),
                                          // height: ScreenUtil().setHeight(172),
                                          child: (detailModel!
                                                          .data!
                                                          .students![index]
                                                          .photo! ==
                                                      "" ||
                                                  detailModel!
                                                          .data!
                                                          .students![index]
                                                          .photo ==
                                                      null)
                                              ? CircleAvatar(
                                                  radius: 80,
                                                )
                                              : CircleAvatar(
                                                  radius: 80,
                                                  backgroundImage: NetworkImage(
                                                      detailModel!
                                                          .data!
                                                          .students![index]
                                                          .photo!),
                                                ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              detailModel!.data!
                                                  .students![index].firstName!,
                                              style: TextStyle(
                                                fontSize: ScreenUtil().setSp(
                                                    29), // smaller font size
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              detailModel!.data!
                                                  .students![index].lastName!,
                                              style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(
                                                      20), // smaller font size
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              detailModel!
                                                  .data!
                                                  .students![index]
                                                  .phoneNumber!,
                                              style: TextStyle(
                                                fontSize: ScreenUtil().setSp(
                                                    20), // smaller font size
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                        right: 0,
                                        child: IconButton(
                                            iconSize: 30,
                                            color: mainColor,
                                            onPressed: () {
                                              CourseActivationDetailsCubit.get(
                                                      context)
                                                  .deleteStudentFromCourse(
                                                      detailModel!
                                                          .data!
                                                          .students![index]
                                                          .id!);
                                            },
                                            icon: Icon(Icons.delete_rounded)))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
