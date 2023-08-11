import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color.dart';

Widget elevate_button({
  required Color backround,
  double width = 238,
  double height = 54,
  double radius = 25.0,
  Color? textColor,
  double fontSizeText = 18,
  required String text,
  required Function() function,
}) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      minimumSize: Size(ScreenUtil().setWidth(width),
          ScreenUtil().setHeight(height)), // set the minimum size
      primary:backround , // set the background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            25.0), // set the border radius
      ),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: fontSizeText, color: textColor),
    ),
  );
}