import 'dart:convert';
import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/home/home_cubit/home_cubit.dart';
import 'package:lang_hub_admin/teachers/teacherDetails/teacher_details_screen.dart';

import '../core/color.dart';
import '../core/widgets/elevate_button.dart';

class TeachersScreen extends StatelessWidget {
  const TeachersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              ConditionalBuilder(
                condition: HomeCubit.get(context).teachersModel != null,
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
                builder: (context) => Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 493 / 162,
                      crossAxisCount: 2, // number of columns
                    ),
                    itemCount: HomeCubit.get(context)
                        .teachersModel!
                        .data!
                        .length, // number of items
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          showCustomDialog(context, "dddd", "tttt", () {});
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
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  // width: ScreenUtil().setWidth(245),
                                  // height: ScreenUtil().setHeight(172),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Image.network(
                                      HomeCubit.get(context)
                                          .teachersModel!
                                          .data![index]
                                          .photo!
                                          .replaceAll(" ",
                                              "%20"), // Replace the space character with %20
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${HomeCubit.get(context).teachersModel!.data![index].firstName!}",
                                      style: TextStyle(
                                        fontSize: ScreenUtil()
                                            .setSp(29), // smaller font size
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "${HomeCubit.get(context).teachersModel!.data![index].lastName!}",
                                      style: TextStyle(
                                        fontSize: ScreenUtil()
                                            .setSp(29), // smaller font size
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      HomeCubit.get(context)
                                          .teachersModel!
                                          .data![index]
                                          .phoneNumber!,
                                      style: TextStyle(
                                        fontSize: ScreenUtil()
                                            .setSp(25), // smaller font size
                                        color: Colors.black,
                                      ),
                                    ),
                                    // Text(
                                    //   HomeCubit.get(context).teachersModel!.data![index],
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
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Uint8List getImage(String imageData) {
  Uint8List bytes = base64Decode(imageData);
  MemoryImage image = MemoryImage(bytes);
  return bytes;
}
