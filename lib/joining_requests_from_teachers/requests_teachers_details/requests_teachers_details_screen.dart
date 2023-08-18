import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:lang_hub_admin/joining_requests_from_teachers/requests_teachers_model.dart";
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
void showRequestTeachersDetailsDialog(BuildContext context, Data data) {
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: (data.photo == "" || data.photo == null)
                              ? Image.network(
                                  data.photo!.replaceAll(" ",
                                      "%20"), // Replace the space character with %20
                                  fit: BoxFit.cover,
                                )
                              : Container(),
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
                              "name is: " + data.firstName!,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(25),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "email: " + data.lastName!,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(25),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data.phoneNumber!,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Text("from:"),
                                  ),
                                  Text("to:"),
                                ],
                              ),
                              Expanded(
                                child: ListView(children: [
                                  DaysTimesWidget(
                                      "Saterday",
                                      (data.time!.saturday == 1) ? true : false,
                                      data.time!.startSaturday!,
                                      data.time!.endSaturday!),
                                  DaysTimesWidget(
                                      "Sunday",
                                      (data.time!.sunday == 1) ? true : false,
                                      data.time!.startSunday!,
                                      data.time!.endSunday!),
                                  DaysTimesWidget(
                                      "Monday",
                                      (data.time!.monday == 1) ? true : false,
                                      data.time!.startMonday!,
                                      data.time!.startMonday!),
                                  DaysTimesWidget(
                                      "Tuesday",
                                      (data.time!.tuesday == 1) ? true : false,
                                      data.time!.startTuesday!,
                                      data.time!.startTuesday!),
                                  DaysTimesWidget(
                                      "Wednesday",
                                      (data.time!.wednsday == 1) ? true : false,
                                      data.time!.startWednsday!,
                                      data.time!.startWednsday!),
                                  DaysTimesWidget(
                                      "Thursday",
                                      (data.time!.thursday == 1) ? true : false,
                                      data.time!.startThursday!,
                                      data.time!.startThursday!),
                                  DaysTimesWidget(
                                      "Friday",
                                      (data.time!.friday == 1) ? true : false,
                                      data.time!.startFriday!,
                                      data.time!.startFriday!),
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
                                      child: Text(data.posts![index].title!)),
                                  Divider(),
                                  Container(
                                    width: ScreenUtil().setWidth(371),
                                    height: ScreenUtil().setHeight(244),
                                    decoration: BoxDecoration(),
                                    clipBehavior: Clip.antiAlias,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: (data.posts![index].image == "" ||
                                              data.posts![index].image == null)
                                          ? Image.network(
                                              data.posts![index].image!.replaceAll(
                                                  " ",
                                                  "%20"), // Replace the space character with %20
                                              fit: BoxFit.cover,
                                            )
                                          : Container(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        itemCount: data.posts!.length,
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
