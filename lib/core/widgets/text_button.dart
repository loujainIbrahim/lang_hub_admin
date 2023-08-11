import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';

Widget DefaultTextButton({required String text,
required Function() function,int number=12
}){
  return TextButton(onPressed: function, child: Text(text,style: TextStyle(
    color: mainColor,
    fontSize:ScreenUtil().setSp(number),
    fontWeight: FontWeight.bold
  ),));
}