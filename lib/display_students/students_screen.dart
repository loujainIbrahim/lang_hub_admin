import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/courses%20activation/course_details/course_details_screen.dart';
import 'package:lang_hub_admin/home/home_cubit/home_cubit.dart';
import 'package:lang_hub_admin/home/home_cubit/home_cubit.dart';

import '../core/color.dart';
import '../core/widgets/snake_bar_widget.dart';

class StudnetScreen extends StatefulWidget {
  final int? id;
  const StudnetScreen({Key? key, this.id}) : super(key: key);

  @override
  State<StudnetScreen> createState() => _StudnetScreenState();
}

class _StudnetScreenState extends State<StudnetScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is AddStudentSuccessState) {
          ErrorSnackBar.show(context, "add successfully");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseDetailsScreen(id: widget.id!)));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.get(context).studentsModel != null,
          fallback: (context) => Center(child: CircularProgressIndicator()),
          builder: (context) => Scaffold(
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 493 / 162,
                crossAxisCount: 2, // number of columns
              ),
              itemCount:
                  HomeCubit.get(context).studentsModel?.data?.length ?? 0,
              // number of items
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Padding(
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                (HomeCubit.get(context)
                                                .studentsModel
                                                ?.data![index]
                                                .photo ==
                                            "" ||
                                        HomeCubit.get(context)
                                                .studentsModel
                                                ?.data![index]
                                                .photo ==
                                            null)
                                    ? Container(
                                        // width: ScreenUtil().setWidth(245),
                                        // height: ScreenUtil().setHeight(172),
                                        child: CircleAvatar(
                                          radius: 60,
                                        ),
                                      )
                                    : Container(
                                        // width: ScreenUtil().setWidth(245),
                                        // height: ScreenUtil().setHeight(172),
                                        child: CircleAvatar(
                                          radius: 60,
                                          backgroundImage: NetworkImage(
                                              HomeCubit.get(context)
                                                  .studentsModel!
                                                  .data![index]
                                                  .photo!),
                                        ),
                                      ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        HomeCubit.get(context)
                                            .studentsModel!
                                            .data![index]
                                            .firstName!,
                                        style: TextStyle(
                                          fontSize: ScreenUtil()
                                              .setSp(27), // smaller font size
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        HomeCubit.get(context)
                                            .studentsModel!
                                            .data![index]
                                            .lastName!,
                                        style: TextStyle(
                                          fontSize: ScreenUtil()
                                              .setSp(27), // smaller font size
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      HomeCubit.get(context)
                                          .studentsModel!
                                          .data![index]
                                          .phoneNumber!,
                                      style: TextStyle(
                                        fontSize: ScreenUtil()
                                            .setSp(20), // smaller font size
                                        color: Colors.black,
                                      ),
                                    ),
                                    // Text(
                                    //   HomeCubit.get(context)
                                    //       .studentsModel!
                                    //       .data![index]
                                    //       .!,
                                    //   style: TextStyle(
                                    //       fontSize: ScreenUtil()
                                    //           .setSp(20), // smaller font size
                                    //       color: Colors.black),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          (widget.id != null)
                              ? Positioned(
                                  right: 7,
                                  bottom: 5,
                                  child: IconButton(
                                      iconSize: 30,
                                      color: mainColor,
                                      onPressed: () {
                                        if (widget.id != null) {
                                          HomeCubit.get(context)
                                              .addStudentsToCourse(
                                                  widget.id!,
                                                  HomeCubit.get(context)
                                                      .studentsModel!
                                                      .data![index]
                                                      .id!);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline_rounded,
                                        size: 40,
                                      )))
                              : Container()
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
