import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';

List<String> days = [
  "Saterday",
  "Sunday",
  "monday",
  "tuasday",
  "wensday",
  "tharsday"
];
void showCustomDialog(
    BuildContext context, String title, String message, Function onOkPressed,
    {bool barrierDismissible = true}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: ScreenUtil().setWidth(882),
          height: ScreenUtil().setHeight(691),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(371),
                    height: ScreenUtil().setHeight(304),
                    child: Image.asset(
                      "assets/images/ll.png",
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                  Container(
                    width: ScreenUtil().setWidth(371),
                    height: ScreenUtil().setHeight(195),
                    decoration: BoxDecoration(
                        color: fillColorInTextFormField,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "name is: " + "loujain ibrahim",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "email: " + "loooo@gmail.com",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "09948367",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("add"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(mainColor),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ))))
                ],
              ),
              Column(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(371),
                    height: ScreenUtil().setHeight(542),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                              width: ScreenUtil().setWidth(371),
                              // height: ScreenUtil().setHeight(244),
                              decoration: BoxDecoration(
                                  color: fillColorInTextFormField,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 5),
                                      alignment: Alignment.topLeft,
                                      width: ScreenUtil().setWidth(371),
                                      child: Text("ddddd")),
                                  Divider(),
                                  Container(
                                    width: ScreenUtil().setWidth(371),
                                    height: ScreenUtil().setHeight(244),
                                    child: Image.asset(
                                      "assets/images/ll.png",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    clipBehavior: Clip.antiAlias,
                                  ),
                                ],
                              ),
                            ),
                        itemCount: 2,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                              height: 20,
                            )),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
