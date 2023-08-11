import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/home/home_cubit/home_cubit.dart';
import 'package:lang_hub_admin/home/home_cubit/home_cubit.dart';

import '../core/color.dart';

class StudnetScreen extends StatelessWidget {
  const StudnetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition:HomeCubit.get(context).studentsModel!=null,
      fallback: (context)=>Center(child: CircularProgressIndicator()),
      builder:(context)=> Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 493 / 162,
            crossAxisCount: 2, // number of columns
          ),
          itemCount: HomeCubit.get(context).studentsModel?.data?.length, // number of items
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                     // width: ScreenUtil().setWidth(245),
                     // height: ScreenUtil().setHeight(172),
                      child: CircleAvatar(
                        radius: 60,
                       // backgroundImage: NetworkImage(HomeCubit.get(context).studentsModel!.data![index].photo!),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Mohammad Ibrahim',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(29), // smaller font size
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '+963976543',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20), // smaller font size
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Mohammd@gmail.com',
                          style: TextStyle(
                              fontSize:
                                  ScreenUtil().setSp(20), // smaller font size
                              color: Colors.black),
                        ),

                      ],
                    ),
                  ],
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
