import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../core/color.dart';
import '../../core/widgets/drop_list_item.dart';
import '../../core/widgets/elevate_button.dart';
import '../../core/widgets/field_item_choose.dart';
import '../../core/widgets/text_field.dart';

class CourseDetailsActivation extends StatefulWidget {
  const CourseDetailsActivation({Key? key}) : super(key: key);

  @override
  State<CourseDetailsActivation> createState() =>
      _CourseDetailsActivationState();
}

class _CourseDetailsActivationState extends State<CourseDetailsActivation> {
  List<String> _items = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wen", "Thu", "Fri"];
  TextEditingController timeinput = TextEditingController();
  String? _selectedItem = 'English';
  TextEditingController numberOfSets = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController Price = TextEditingController();
  bool selected = false;
  bool timeSat = false;

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
          "courses are activation",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "choose language",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        DropListItem(
                          item: _selectedItem,
                          s: _items,
                          h: 65,
                          w: 549,
                        ),
                        Text(
                          "number of sets:",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(controller: numberOfSets, ontap: () {}),
                        Text(
                          "start date: ",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(controller: startDate, ontap: () {}),
                        Text(
                          "end date:",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(controller: endDate, ontap: () {}),
                        Text(
                          "add price:",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(controller: Price, ontap: () {}),
                        Text(
                          "choose level",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        DropListItem(
                          item: _selectedItem,
                          s: _items,
                          h: 65,
                          w: 549,
                        ),
                      ]),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: ScreenUtil().setWidth(668),
                          height: ScreenUtil().setHeight(80),
                          child: Text(
                              "choose the time before choose the teacher please for found the time common between teacher and your cours"),
                        ),
                      ),
                      BuildListChooseTime(true, numberOfSets),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "choose your teacher:",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                      ),
                      DropListItem(
                        item: _selectedItem,
                        s: _items,
                        h: 65,
                        w: 549,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 20.0),
            child: elevate_button(
                width: 305,
                height: 65,
                backround: mainColor,
                text: 'Add',
                function: () {}),
          ),
        ],
      ),
    );
  }

  Widget BuildListChooseTime(bool days, TextEditingController controller) {
    return Container(
      width: ScreenUtil().setWidth(480),
      // height: ScreenUtil().setHeight(260),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 140.0),
                child: Text("from:"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("to:"),
              ),
            ],
          ),
          BuildItemTimeChoose(true, numberOfSets),
          BuildItemTimeChoose(true, numberOfSets),
          BuildItemTimeChoose(true, numberOfSets),
          BuildItemTimeChoose(true, numberOfSets),
          BuildItemTimeChoose(true, numberOfSets),
          BuildItemTimeChoose(true, numberOfSets),
          BuildItemTimeChoose(true, numberOfSets),
        ],
      ),
    );
  }

  Widget BuildItemTimeChoose(bool days, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20, bottom: 10),
          child: BuidSwitch(days),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ItemField(
              w: 95,
              h: 39,
              controller: controller,
              ontap: () {
                showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                ).then((value) {
                  setState(() {
                    controller.text = value!.format(context);
                  });
                });
              }),
        ),
        ItemField(
            w: 95,
            h: 39,
            controller: controller,
            ontap: () {
              showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              ).then((value) {
                setState(() {
                  controller.text = value!.format(context);
                });
              });
            }),
      ],
    );
  }

  Widget BuidSwitch(bool t) {
    return Container(
      width: ScreenUtil().setWidth(144),
      height: ScreenUtil().setHeight(45),
      child: LiteRollingSwitch(
        value: t,
        textOn: 'Sat',
        textOff: 'Sat',
        colorOn: mainColor,
        textOffColor: Colors.white,
        textOnColor: Colors.white,
        colorOff: Colors.grey,
        iconOff: Icons.delete,
        iconOn: Icons.add,
        // animationDuration: const Duration(milliseconds: 300),
        onChanged: (bool state) {
          setState(() {
            t = state;
          });
        },
        onDoubleTap: () {},
        onSwipe: () {},
        onTap: () {},
      ),
    );
  }
}
