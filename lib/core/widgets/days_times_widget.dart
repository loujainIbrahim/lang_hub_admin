import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';

Widget DaysTimesWidget(String name_day, bool day, String date1, String date2) {
  return Container(
    width: ScreenUtil().setWidth(490),
    height: ScreenUtil().setHeight(50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Text(name_day,style: TextStyle(fontSize: 20.sp),)),
        Checkbox(
          activeColor: Colors.green,
          value: day,
          onChanged: (bool? value) {},
        ),
        TimeContainer(date1),
        SizedBox(width: 5.w,),
        TimeContainer(date2)
        ///////////
      ],
    ),
  );
}

Widget TimeContainer(String time) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: fillColorInTextFormField,
        border: Border(
            top: BorderSide(color: mainColor),
            left: BorderSide(color: mainColor),
            right: BorderSide(color: mainColor),
            bottom: BorderSide(color: mainColor)),
        borderRadius: BorderRadius.circular(25)),
    width: 95.w,
    height: 33.h,
    child: Text(
      time,
    ),
  );
}
