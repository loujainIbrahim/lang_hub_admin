import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/color.dart';

class UpdateTimeTheWaitScreen extends StatefulWidget {
  const UpdateTimeTheWaitScreen({Key? key}) : super(key: key);

  @override
  State<UpdateTimeTheWaitScreen> createState() =>
      _UpdateTimeTheWaitScreenState();
}

class _UpdateTimeTheWaitScreenState extends State<UpdateTimeTheWaitScreen> {
  List<String> _items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  String? _selectedItem = '1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: ScreenUtil().setWidth(1190),

            padding: EdgeInsets.only(right: 20, top: 10, bottom: 20),
            child: Text(
              'You can adjust the waiting period for the student to review the institute '
              'to determine the level and pay the cost of the course:',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(29), // smaller font size
                  color: mainColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "choose day",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(30), // smaller font size
              color: mainColor,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: ScreenUtil().setWidth(449),
            height: ScreenUtil().setHeight(55),
            child: Material(
              color: fillColorInTextFormField,
              borderRadius: BorderRadius.circular(5.0),
              elevation: 2.0,
              child: DropdownButton<String>(
                alignment: Alignment.center,
                iconEnabledColor: mainColor,
                isExpanded: true,
                value: _selectedItem,
                underline: Container(color: Colors.transparent,),
                items: _items.map((String value) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (selectedItem) {
                  setState(() {
                    _selectedItem = selectedItem;
                  });
                },

              ),
            ),
          ),
        ],
      ),
    );
  }
}
