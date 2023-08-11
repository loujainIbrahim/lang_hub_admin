import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/exams/add_exams/add_exams_screen.dart';

import '../../core/color.dart';
import '../../core/widgets/elevate_button.dart';
import '../../languages_and_offers/widgets/dialog_widget.dart';

class DsiplayExamsScreen extends StatelessWidget {
  const DsiplayExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: mainColor),
        width: ScreenUtil().setWidth(234), // set the width here
        child: FloatingActionButton(
          backgroundColor: mainColor,
          // isExtended: true,
          //clipBehavior: Clip.antiAliasWithSaveLayer,
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => AddExamsScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Add exam'),
              Icon(Icons.add_circle_outline),
              // add some space between the icon and the text
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                elevate_button(
                    width: 238,
                    height: 54,
                    backround: mainColor,
                    text: "English",
                    function: () {}),
                elevate_button(
                    backround: mainColor, text: "Spanish", function: () {}),
                elevate_button(
                    backround: mainColor, text: "germany", function: () {}),
                elevate_button(
                    backround: mainColor, text: "french", function: () {}),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 256 / 200,
                crossAxisCount: 4, // number of columns
                crossAxisSpacing: 10.0, // spacing between columns
                mainAxisSpacing: 10.0, // spacing between rows
              ),
              itemCount: 10, // number of items
              itemBuilder: (BuildContext context, int index) {
                return BuildItemListView(
                    context, "assets/images/ll.png", "Antro A", "23");
              },
            ),
          )
        ],
      ),
    );
  }

  Widget BuildItemListView(
      BuildContext context, String image, String name, String hours) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: ScreenUtil().setWidth(246),
        height: ScreenUtil().setHeight(122),
        decoration: BoxDecoration(
          color: fillColorInTextFormField,
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(38.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              width: double.infinity,
              height: ScreenUtil().setHeight(180),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(281),
              height: ScreenUtil().setHeight(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hours + " hours",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30), // smaller font size
                        color: mainColor,
                        fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                        color: mainColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        size: 30,
                        color: mainColor,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
