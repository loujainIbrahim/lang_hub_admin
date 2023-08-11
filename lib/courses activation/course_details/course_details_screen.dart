import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/teachers/teachers_screen.dart';

import '../../core/color.dart';
import '../../core/widgets/days_times_widget.dart';
import '../../core/widgets/elevate_button.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(color: mainColor),
            top: BorderSide(color: mainColor),
            right: BorderSide(color: mainColor),
            left: BorderSide(color: mainColor)),
        elevation: 0,
        leadingWidth: 200,
        backgroundColor: fillColorInTextFormField,
        centerTitle: true,
        leading: Image.asset(
          "assets/images/home_logo.png",
          fit: BoxFit.fill,
        ),
        title: Text(
          "Course details",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(407),
                    height: ScreenUtil().setHeight(380),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(38),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(38),
                      child: Image.network(
                        'assets/images/login.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text(
                              "given by loujain",
                              style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeachersScreen()));
                                },
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                      ),
                      Text(
                        "Antro A",
                        style: TextStyle(
                            fontSize: 31.sp,
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                      Text(
                        "5500s.p",
                        style: TextStyle(
                            fontSize: 31.sp,
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                      Text(
                        "30hours",
                        style: TextStyle(
                            fontSize: 31.sp,
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                      Text(
                        "15seats",
                        style: TextStyle(
                            fontSize: 31.sp,
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                    ],
                  ),
                  Container(
                    width: 373.w,
                    height: 380.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Text("from:"),
                            ),
                            Text("to:"),
                          ],
                        ),
                        Expanded(
                          child: ListView(shrinkWrap: true, children: [
                            DaysTimesWidget("Saterday", true, "4:00", "6:00"),
                            DaysTimesWidget("Sunday", true, "4:00", "6:00"),
                            DaysTimesWidget("Monday", true, "4:00", "6:00"),
                            DaysTimesWidget("Tuesday", true, "4:00", "6:00"),
                            DaysTimesWidget("Wednesday", true, "4:00", "6:00"),
                            DaysTimesWidget("Thursday", true, "4:00", "6:00"),
                            DaysTimesWidget("Friday", true, "4:00", "6:00"),
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 50.0, top: 8, bottom: 8),
                    child: elevate_button(
                        width: 257,
                        height: 66,
                        backround: mainColor,
                        text: "add student",
                        function: () {}),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 493 / 162,
                  crossAxisCount: 2, // number of columns
                ),
                itemCount: 10, // number of items
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Container(
                      width: ScreenUtil().setWidth(493),
                      height: ScreenUtil().setHeight(150),
                      decoration: BoxDecoration(
                        color: fillColorInTextFormField,
                        border: Border.all(
                          color: mainColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                // width: ScreenUtil().setWidth(245),
                                // height: ScreenUtil().setHeight(172),
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjHVjH-y6VIHOEBe8lP4JrDoyT9Cq-hG4KYAp1ngA&s'),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Mohammad Ibrahim',
                                    style: TextStyle(
                                      fontSize: ScreenUtil()
                                          .setSp(29), // smaller font size
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '+963976543',
                                    style: TextStyle(
                                      fontSize: ScreenUtil()
                                          .setSp(20), // smaller font size
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Mohammd@gmail.com',
                                    style: TextStyle(
                                        fontSize: ScreenUtil()
                                            .setSp(20), // smaller font size
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                              right: 0,
                              child: IconButton(
                                  iconSize: 30,
                                  color: mainColor,
                                  onPressed: () {},
                                  icon: Icon(Icons.delete_rounded)))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
