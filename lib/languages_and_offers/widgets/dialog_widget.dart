import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/add_courses/add_course_screen.dart';
import 'package:lang_hub_admin/add_offer/add_offer_screen.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/core/widgets/elevate_button.dart';

void DialogWidget(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: fillColorInTextFormField,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            width: ScreenUtil().setWidth(610),
            height: ScreenUtil().setHeight(435),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "When clicking on Add Course, a level will be"
                  "added to a specific series of languages ​​offered "
                  "by the institute.",
                  style: TextStyle(fontSize: ScreenUtil().setSp(25)),
                ),
                elevate_button(
                    width: 298,
                    height: 55,
                    backround: mainColor,
                    text: "Add course",
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCourseScreen()));
                    }),
                Text(
                    "When you click on Add Presentation, an offer"
                    "will be added that can be given at your institute",
                    style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                elevate_button(
                    width: 298,
                    height: 55,
                    backround: mainColor,
                    text: "Add offer",
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddOfferScreen()));
                    })
              ],
            ),
          ),
        );
      });
}
