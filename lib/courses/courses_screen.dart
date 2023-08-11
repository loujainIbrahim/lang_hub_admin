import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // number of columns
        crossAxisSpacing: 10.0, // spacing between columns
        mainAxisSpacing: 10.0, // spacing between rows
      ),
      itemCount: 10, // number of items
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: ScreenUtil().setWidth(245),
            height: ScreenUtil().setHeight(255),
            decoration: BoxDecoration(
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
                    borderRadius: BorderRadius.circular(38.0),
                  ),
                  width: ScreenUtil().setWidth(245),
                  height: ScreenUtil().setHeight(172),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(38.0),
                    child: Image.network(
                      'https://picsum.photos/200',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'given by loujain',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20), // smaller font size
                      color: mainColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Antro A',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20), // smaller font size
                      color: mainColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '5500s.p',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20), // smaller font size
                    color: mainColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
