import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';

Widget ItemField(
    {required TextEditingController controller,
    int w = 549,
    int h = 65,
    int? maxxLines,
    required Function() ontap}) {
  return SizedBox(
      height: ScreenUtil().setHeight(h),
      width: ScreenUtil().setWidth(w),
      child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: maxxLines,
          onTap: ontap,
          controller: controller,
          cursorColor: mainColor,
          validator: (value) {
            if (value!.isEmpty) {
              return "this must be do\'nt empty";
            }
            return null;
          },
          style: TextStyle(color: Color(0xff210440)),
          decoration: InputDecoration(
              filled: true,
              fillColor: fillColorInTextFormField,
              labelStyle: TextStyle(color: mainColor),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 2.w, color: mainColor)),
              hintStyle: TextStyle(color: mainColor),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFF210440),
                  )))));
}
