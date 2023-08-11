import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/joining_requests/requests_teachers_details/requests_teachers_details_screen.dart';

class JoiningRequestsScreen extends StatelessWidget {
  const JoiningRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: mainColor, // set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // set the border radius
                  ),
                  minimumSize: Size(ScreenUtil().setWidth(238),
                      ScreenUtil().setHeight(54)), // set the minimum size
                ),
                onPressed: () {},
                child: Text("student"),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(ScreenUtil().setWidth(238),
                        ScreenUtil().setHeight(54)), // set the minimum size
                    primary: mainColor, // set the background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25.0), // set the border radius
                    ),
                  ),
                  onPressed: () => showRequestTeachersDetailsDialog(context),
                  child: Text("teachers"))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BuildListViewItem();
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

Widget BuildListViewItem() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    child: Container(
      width: ScreenUtil().setWidth(900),
      height: ScreenUtil().setHeight(151),
      decoration: BoxDecoration(
        color: fillColorInTextFormField,
        border: Border.all(
          color: mainColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            width: ScreenUtil().setWidth(245),
            height: ScreenUtil().setHeight(172),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Mohammad Ibrahim',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(26), // smaller font size
                  color: Colors.black,
                ),
              ),
              Text(
                '+963976543',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18), // smaller font size
                  color: Colors.black,
                ),
              ),
              Text(
                'Mohammd@gmail.com',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(18), // smaller font size
                    color: Colors.black),
              ),
              Text(
                'The Language :English',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(18), // smaller font size
                    color: Colors.black),
              )
            ],
          ),
          Spacer(),
          Container(
            width: ScreenUtil().setWidth(244),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // set the background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // set the border radius
                          ),
                          minimumSize: Size(
                              ScreenUtil().setWidth(103),
                              ScreenUtil()
                                  .setHeight(30)), // set the minimum size
                        ),
                        onPressed: () {},
                        child: Text(
                          style: TextStyle(color: Colors.black),
                          "Approve",
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // set the background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                25.0), // set the border radius
                          ),
                          minimumSize: Size(
                              ScreenUtil().setWidth(103),
                              ScreenUtil()
                                  .setHeight(30)), // set the minimum size
                        ),
                        onPressed: () {},
                        child: Text("Reject",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
