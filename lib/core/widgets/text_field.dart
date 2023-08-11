import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';
Widget myTextField({
  required TextEditingController controller,
  double height = 42,
  double width = 463.6,
  bool obscureText = false,
  String validatorValue = "",
  String labelText = "",
  String hintText = "",
  Widget? suffixIcon,
  TextInputType? keyboardType,
  Icon? prefixIcon,
  ValueChanged<String>? onFieldSubmitted,
  int? maxxLines,
  int? minLines,

}) =>
    SizedBox(
        height: height,
        width: width,

        child:TextFormField(

          maxLines: maxxLines,
            controller: controller,
            cursorColor: mainColor,
            keyboardType: keyboardType,
            onFieldSubmitted: onFieldSubmitted,
            validator: (value) {
              if (value!.isEmpty) {
                return validatorValue;
              }
              return null;
            },
            style: TextStyle(color: Color(0xff210440)),
            obscureText: obscureText,
            decoration: InputDecoration(
               // contentPadding: EdgeInsets.symmetric(vertical: 16),
                filled: true,
                fillColor: fillColorInTextFormField,
                labelText: labelText,
                labelStyle:  TextStyle(color:mainColor),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        width: 2.w,
                        color: mainColor
                    )
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                suffixIconColor:mainColor,
                prefixIconColor: mainColor,
                hintText: hintText,
                hintStyle: TextStyle(color: mainColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: mainColor,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF210440),)
                )))
    );