import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/color.dart';
import '../../core/widgets/field_item_choose.dart';
import '../../core/widgets/days_times_widget.dart';

List<String> name_days = [
  "Saturday",
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday"
];
List<bool> bool_days = [true, false, true, false, true, false, true];
List<String> time_strings = [
  "dvsdvs",
  "dvsdvs",
  "sweff",
  "fgbfb",
  "ggn",
  "gjgj",
  "ytytr"
];
void showRequestTeachersDetailsDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: ScreenUtil().setWidth(882),
            height: ScreenUtil().setHeight(935),
            child: Row(
              children: [
                Expanded(
                  child: Column(
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
                      /////////////////
                      Expanded(
                        // width: 338.w,
                        // height: 410.h,
                        child: Container(
                          width: 338.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Text("from:"),
                                  ),
                                  Text("to:"),
                                ],
                              ),
                              Expanded(

                                child: ListView(
                                    children: [
                                      DaysTimesWidget(
                                      "Saterday", true, "4:00", "6:00"),
                                      DaysTimesWidget(
                                      "Sunday", true, "4:00", "6:00"),
                                      DaysTimesWidget(
                                      "Monday", true, "4:00", "6:00"),
                                      DaysTimesWidget(
                                      "Tuesday", true, "4:00", "6:00"),
                                      DaysTimesWidget(
                                      "Wednesday", true, "4:00", "6:00"),
                                      DaysTimesWidget(
                                      "Thursday", true, "4:00", "6:00"),
                                      DaysTimesWidget(
                                      "Friday", true, "4:00", "6:00"),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),

                      ElevatedButton(
                          onPressed: () {
                            print(name_days.length);
                            print(bool_days.length);
                            print(time_strings.length);
                          },
                          child: Text("add"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(mainColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              )))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: ScreenUtil().setWidth(352),
                    height: ScreenUtil().setHeight(820),
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
                                      padding: EdgeInsets.only(top: 10),
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
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 20,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
