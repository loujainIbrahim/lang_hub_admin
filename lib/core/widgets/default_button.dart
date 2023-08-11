import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color.dart';

Widget defaultbutton({
  required Color backround,
  double width = 222.0,
  double height = 41,
  double radius = 25.0,
  Color? textColor,
  double fontSizeText = 18,
  required String text,
  required Function() function,
}) {
  return Container(
    width: width,
    height: height,

    child: MaterialButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSizeText, color: textColor),
      ),
    ),
    decoration: BoxDecoration(
      border: Border.all(
          color: mainColor
      ),
      borderRadius: BorderRadius.circular(radius.r),
      color: backround,
    ),
  );
}