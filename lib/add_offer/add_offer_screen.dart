import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../core/color.dart';
import '../core/widgets/drop_list_item.dart';
import '../core/widgets/elevate_button.dart';
import '../core/widgets/field_item_choose.dart';

class AddOfferScreen extends StatefulWidget {
  const AddOfferScreen({Key? key}) : super(key: key);

  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  TextEditingController description = TextEditingController();
  TextEditingController nameOffer = TextEditingController();
  TextEditingController numberOfHours = TextEditingController();
  TextEditingController numberOfSets = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController Price = TextEditingController();
  List<String> _items = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wen", "Thu", "Fri"];
  String _selectedItem = 'English';
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
          "Add offer",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 7,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: ScreenUtil().setWidth(1844),
                  height: ScreenUtil().setHeight(80),
                  child: Text(
                    "You can add an offer in your institute that students can enroll in, and it can be a strengthening"
                    " course for a language type such as IELTS and TOEFL, or special academic courses:  ",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30), color: mainColor),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(547),
                    height: ScreenUtil().setHeight(390),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'assets/images/login.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Description:",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(25), // smaller font size
                        color: mainColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: ItemField(h: 100,
                         controller: description, ontap: () {}),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "name offer:",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), // smaller font size
                      color: mainColor,
                    ),
                  ),
                  ItemField(controller: nameOffer, ontap: () {}),
                  Text(
                    "number of hours:",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), // smaller font size
                      color: mainColor,
                    ),
                  ),
                  ItemField(controller: numberOfHours, ontap: () {}),
                  Text(
                    "number of sets:",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), // smaller font size
                      color: mainColor,
                    ),
                  ),
                  ItemField(controller: numberOfSets, ontap: () {}),
                  Text(
                    "start date: ",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), // smaller font size
                      color: mainColor,
                    ),
                  ),
                  ItemField(controller: startDate, ontap: () {}),
                  Text(
                    "end date:",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), // smaller font size
                      color: mainColor,
                    ),
                  ),
                  ItemField(controller: endDate, ontap: () {}),
                  Text(
                    "add price:",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25), // smaller font size
                      color: mainColor,
                    ),
                  ),
                  ItemField(controller: Price, ontap: () {}),
                ],
              ),
              Column(children: [
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
              ])
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20.0),
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
