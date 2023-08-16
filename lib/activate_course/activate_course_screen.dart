import 'dart:html';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lang_hub_admin/activate_course/activate_course_cubit.dart';
import 'package:lang_hub_admin/core/widgets/text_field.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../core/color.dart';
import '../core/widgets/drop_list_item.dart';
import '../core/widgets/elevate_button.dart';
import '../core/widgets/field_item_choose.dart';
import 'package:flutter/material.dart';

class ActivateCourseScreen extends StatefulWidget {
  const ActivateCourseScreen({Key? key}) : super(key: key);

  @override
  State<ActivateCourseScreen> createState() => _ActivateCourseScreen();
}

class _ActivateCourseScreen extends State<ActivateCourseScreen> {
  TextEditingController description = TextEditingController();
  TextEditingController nameOffer = TextEditingController();
  TextEditingController numberOfHours = TextEditingController();
  TextEditingController numberOfSets = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController Price = TextEditingController();

  // DateTime _selectedDate = DateTime.now();
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  List<String> _items = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wen", "Thu", "Fri"];
  String _selectedItem = 'English';
  TextEditingController Sat1 = TextEditingController();
  TextEditingController Sun1 = TextEditingController();
  TextEditingController Mon1 = TextEditingController();
  TextEditingController Tue1 = TextEditingController();
  TextEditingController Wen1 = TextEditingController();
  TextEditingController Thu1 = TextEditingController();
  TextEditingController Fri1 = TextEditingController();
  TextEditingController Sat2 = TextEditingController();
  TextEditingController Sun2 = TextEditingController();
  TextEditingController Mon2 = TextEditingController();
  TextEditingController Tue2 = TextEditingController();
  TextEditingController Wen2 = TextEditingController();
  TextEditingController Thu2 = TextEditingController();
  TextEditingController Fri2 = TextEditingController();
  bool OnSat = false;
  bool OnSun = false;
  bool OnMon = false;
  bool OnTue = false;
  bool OnWen = false;
  bool OnThu = false;
  bool OnFri = false;
  DateTime starDate = DateTime.now();
  DateTime enDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivateCourseCubit(),
      child: BlocConsumer<ActivateCourseCubit, ActivateCourseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
                "Activate course",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              ),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "choose language",
                            style: TextStyle(
                              fontSize:
                                  ScreenUtil().setSp(25), // smaller font size
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
                        Text(
                          "number of sets:",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(
                            h: 85, controller: numberOfSets, ontap: () {}),
                        Text(
                          "start date: ",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(
                            h: 85,
                            controller: startDate,
                            ontap: () async {
                              await _pickDate(startDate);
                              starDate = DateTime.parse(startDate.text);
                            }),
                        Text(
                          "end date:",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(
                            h: 85,
                            controller: endDate,
                            ontap: () async {
                              await _pickDate(endDate);
                              enDate == DateTime.parse(startDate.text);
                            }),
                        Text(
                          "add price:",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil().setSp(25), // smaller font size
                            color: mainColor,
                          ),
                        ),
                        ItemField(h: 85, controller: Price, ontap: () {}),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "choose level:",
                            style: TextStyle(
                              fontSize:
                                  ScreenUtil().setSp(25), // smaller font size
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
                    Column(children: [
                      Container(
                        width: ScreenUtil().setWidth(800),
                        height: ScreenUtil().setHeight(100),
                        child: Text(
                          "choose the time before choose the teacher please"
                          "for found the time common between teacher and"
                          "your course ",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(30),
                              color: mainColor),
                        ),
                      ),
                      BuildListChooseTime(
                          OnSat,
                          OnSun,
                          OnMon,
                          OnTue,
                          OnWen,
                          OnThu,
                          OnFri,
                          Sat1,
                          Sun1,
                          Mon1,
                          Tue1,
                          Wen1,
                          Thu1,
                          Fri1,
                          Sat2,
                          Sun2,
                          Mon2,
                          Tue2,
                          Wen2,
                          Thu2,
                          Fri2),
                      Text(
                        "choose your teacher:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(25), // smaller font size
                          color: mainColor,
                        ),
                      ),
                      DropListItem(
                        item: _selectedItem,
                        s: _items,
                        h: 65,
                        w: 449,
                      ),
                    ])
                  ],
                ),
                ConditionalBuilder(
                    condition: state is! ActivateCourseLoadingState,
                    fallback: (context) => Center(
                          child: Container(
                              width: 40,
                              height: 20,
                              child: CircularProgressIndicator()),
                        ),
                    builder: (context) {
                      return elevate_button(
                          width: 305,
                          height: 55,
                          backround: mainColor,
                          text: 'Activate',
                          function: () {
                            int num = int.parse(numberOfSets.text);
                            int p = int.parse(Price.text);

                            ActivateCourseCubit.get(context).ActiveCoursePost(
                                num,
                                starDate,
                                enDate,
                                p,
                                (OnSat) ? 1 : 0,
                                (Sat1.text != null) ? Sat1.text : "-",
                                (Sat2.text != null) ? Sat2.text : "-",
                                (OnSun) ? 1 : 0,
                                (Sun1.text != null) ? Sun1.text : "-",
                                (Sun2.text != null) ? Sun2.text : "-",
                                (OnMon) ? 1 : 0,
                                (Mon1.text != null) ? Mon1.text : "-",
                                (Mon2.text != null) ? Mon2.text : "-",
                                (OnTue) ? 1 : 0,
                                (Tue1.text != null) ? Tue1.text : "-",
                                (Tue2.text != null) ? Tue2.text : "-",
                                (OnWen) ? 1 : 0,
                                (Wen1.text != null) ? Wen1.text : "-",
                                (Wen2.text != null) ? Wen2.text : "-",
                                (OnThu) ? 1 : 0,
                                (Thu1.text != null) ? Thu1.text : "-",
                                (Thu2.text != null) ? Thu2.text : "-",
                                (OnFri) ? 1 : 0,
                                (Fri1.text != null) ? Fri1.text : "-",
                                (Fri2.text != null) ? Fri2.text : "-");
                            print(num);
                            print(starDate);
                            print(enDate);
                            print(p);
                            print(OnSat);
                            print(Sat1.text);
                            print(Sat2.text);
                            print(OnSun);
                            print(Sun1.text);
                            print(Sun2.text);
                            print(OnMon);
                            print(Mon1.text);
                            print(Mon2.text);
                            print(OnTue);
                            print(Tue1.text);
                            print(Tue2.text);
                            print(OnWen);
                            print(Wen1.text);
                            print(Wen2.text);
                            print(OnThu);
                            print(Thu1.text);
                            print(Thu2.text);
                            print(OnFri);
                            print(Fri1.text);
                            print(Fri2.text);
                          });
                    })
              ],
            ),
          );
        },
      ),
    );
  }

  Widget BuildListChooseTime(
      bool one,
      bool two,
      bool three,
      bool four,
      bool five,
      bool six,
      bool seven,
      TextEditingController Sat1,
      TextEditingController Sun1,
      TextEditingController Mon1,
      TextEditingController Tue1,
      TextEditingController Wen1,
      TextEditingController Thu1,
      TextEditingController Fri1,
      TextEditingController Sat2,
      TextEditingController Sun2,
      TextEditingController Mon2,
      TextEditingController Tue2,
      TextEditingController Wen2,
      TextEditingController Thu2,
      TextEditingController Fri2) {
    return Container(
      width: ScreenUtil().setWidth(480),
      // height: ScreenUtil().setHeight(260),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "from:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                child: Text("to:", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          BuildItemTimeChoose("Sat", one, Sat1, Sat2),
          BuildItemTimeChoose("Sun", two, Sun1, Sun2),
          BuildItemTimeChoose("Mon", three, Mon1, Mon2),
          BuildItemTimeChoose("Tue", four, Tue1, Tue2),
          BuildItemTimeChoose("Wen", five, Wen1, Wen2),
          BuildItemTimeChoose("Thu", six, Thu1, Thu2),
          BuildItemTimeChoose("Fri", seven, Fri1, Fri2),
        ],
      ),
    );
  }

  Widget BuildItemTimeChoose(String day, bool days, TextEditingController one,
      TextEditingController two) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuidSwitch(day, days),
          ItemField(
              w: 150,
              h: 85,
              controller: one,
              ontap: () {
                showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                ).then((value) {
                  setState(() {
                    // if (isValidTime(value!.format(context))) {
                    setState(() {
                      one.text = value!.format(context);
                    });
                    // }else {
                    //   // Handle invalid time
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         title: Text('Invalid Time'),
                    //         content: Text('Please select a valid time.'),
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //             child: Text('OK'),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                  });
                });
              }),
          ItemField(
              w: 150,
              h: 85,
              controller: two,
              ontap: () {
                showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                ).then((value) {
                  setState(() {
                    // if (isValidTime(value!.format(context))) {
                    setState(() {
                      two.text = value!.format(context);
                    });
                    // }else {
                    //   // Handle invalid time
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         title: Text('Invalid Time'),
                    //         content: Text('Please select a valid time.'),
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //             child: Text('OK'),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                  });
                });
              }),
        ],
      ),
    );
  }

  // bool isValidTime(String time) {
  //   final startTime = TimeOfDay(hour: 9, minute: 0);
  //   final endTime = TimeOfDay(hour: 18, minute: 0);
  //
  //   final selectedTime = TimeOfDay.fromDateTime(
  //     DateFormat.jm().parse(time),
  //   );
  //
  //   final selectedMinutes = selectedTime.hour * 60 + selectedTime.minute;
  //   final startMinutes = startTime.hour * 60 + startTime.minute;
  //   final endMinutes = endTime.hour * 60 + endTime.minute;
  //
  //   return selectedMinutes >= startMinutes && selectedMinutes <= endMinutes;
  // }

  Widget BuidSwitch(String day, bool t) {
    return Container(
      width: ScreenUtil().setWidth(144),
      height: ScreenUtil().setHeight(55),
      child: LiteRollingSwitch(
        value: t,
        textOn: day,
        textOff: day,
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

  Future<void> _pickDate(TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Change the colors and styles of the date picker here
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.blue,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        newValue:
        controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }
}
