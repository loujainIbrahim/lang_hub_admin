import 'dart:html';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_time_picker.dart';
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
  final int id;
  const ActivateCourseScreen({Key? key, required this.id}) : super(key: key);

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

  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wen", "Thu", "Fri"];
  final List<String> dropdownItemsLang = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  final List<String> dropdownItemsLevel = [
    'Intro A',
    'Intro B',
    'Intro C',
    'Intro D'
  ];
  final List<String> dropdownItemsTeacher = [
    'Loujain',
    'Moauz',
    'Abd',
    'Kassem'
  ];
  String? selectedDropdownItemLang;
  String? selectedDropdownItemLevel;
  String? selectedDropdownTeacher;
  String _selectedItem = 'English';
  TextEditingController Sat1 = TextEditingController(text: "-");
  TextEditingController Sun1 = TextEditingController(text: "-");
  TextEditingController Mon1 = TextEditingController(text: "-");
  TextEditingController Tue1 = TextEditingController(text: "-");
  TextEditingController Wen1 = TextEditingController(text: "-");
  TextEditingController Thu1 = TextEditingController(text: "-");
  TextEditingController Fri1 = TextEditingController(text: "-");
  TextEditingController Sat2 = TextEditingController(text: "-");
  TextEditingController Sun2 = TextEditingController(text: "-");
  TextEditingController Mon2 = TextEditingController(text: "-");
  TextEditingController Tue2 = TextEditingController(text: "-");
  TextEditingController Wen2 = TextEditingController(text: "-");
  TextEditingController Thu2 = TextEditingController(text: "-");
  TextEditingController Fri2 = TextEditingController(text: "-");

  bool OnSat = false;
  bool OnSun = false;
  bool OnMon = false;
  bool OnTue = false;
  bool OnWen = false;
  bool OnThu = false;
  bool OnFri = false;
  DateTime starDate = DateTime.now();
  DateTime enDate = DateTime.now();
  DateTime selectedTime = DateTime.now();

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
                        DropdownButtonWidget(
                          h: 50.h,
                          w: 250.w,
                          items: dropdownItemsLang,
                          selectedItem: selectedDropdownItemLang,
                          onChanged: (String? selectedItem) {
                            selectedDropdownItemLang = selectedItem;
                            print('Selected item: $selectedItem');
                          },
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
                        DropdownButtonWidget(
                          h: 50.h,
                          w: 250.w,
                          items: dropdownItemsLevel,
                          selectedItem: selectedDropdownItemLevel,
                          onChanged: (String? selectedItem) {
                            selectedDropdownItemLevel = selectedItem;
                            print('Selected item: $selectedItem');
                          },
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
                      Container(
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
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 4),
                                  child: Text("to:",
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ],
                            ),
                            Container(
                              width: ScreenUtil().setWidth(480),
                              // height: ScreenUtil().setHeight(260),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(144),
                                          height: ScreenUtil().setHeight(55),
                                          child: LiteRollingSwitch(
                                            value: OnSat,
                                            textOn: days[0],
                                            textOff: days[0],
                                            colorOn: mainColor,
                                            textOffColor: Colors.white,
                                            textOnColor: Colors.white,
                                            colorOff: Colors.grey,
                                            iconOff: Icons.delete,
                                            iconOn: Icons.add,
                                            // animationDuration: const Duration(milliseconds: 300),
                                            onChanged: (bool state) {
                                              setState(() {
                                                OnSat = state;
                                                print(
                                                    "boooooooooooooooolllllllll ");
                                                print(OnSat);
                                              });
                                            },
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            onTap: () {},
                                          ),
                                        ),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Sat1,
                                            ontap: () {
                                              _selectTime(context,Sat1);
                                              print(selectedTime);
                                            }),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Sat2,
                                            ontap: () {
                                              _selectTime(context,Sat2);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(144),
                                          height: ScreenUtil().setHeight(55),
                                          child: LiteRollingSwitch(
                                            value: OnSun,
                                            textOn: days[1],
                                            textOff: days[1],
                                            colorOn: mainColor,
                                            textOffColor: Colors.white,
                                            textOnColor: Colors.white,
                                            colorOff: Colors.grey,
                                            iconOff: Icons.delete,
                                            iconOn: Icons.add,
                                            // animationDuration: const Duration(milliseconds: 300),
                                            onChanged: (bool state) {
                                              setState(() {
                                                OnSun = state;
                                                print(
                                                    "boooooooooooooooolllllllll ");
                                                print(OnSun);
                                              });
                                            },
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            onTap: () {},
                                          ),
                                        ),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Sun1,
                                            ontap: () {
                                              _selectTime(context,Sun1);
                                            }),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Sun2,
                                            ontap: () {
                                              _selectTime(context,Sun2);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(144),
                                          height: ScreenUtil().setHeight(55),
                                          child: LiteRollingSwitch(
                                            value: OnMon,
                                            textOn: days[2],
                                            textOff: days[2],
                                            colorOn: mainColor,
                                            textOffColor: Colors.white,
                                            textOnColor: Colors.white,
                                            colorOff: Colors.grey,
                                            iconOff: Icons.delete,
                                            iconOn: Icons.add,
                                            // animationDuration: const Duration(milliseconds: 300),
                                            onChanged: (bool state) {
                                              setState(() {
                                                OnMon = state;
                                                print(
                                                    "boooooooooooooooolllllllll ");
                                                print(OnMon);
                                              });
                                            },
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            onTap: () {},
                                          ),
                                        ),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Mon1,
                                            ontap: () {
                                              _selectTime(context,Mon1);
                                            }),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Mon2,
                                            ontap: () {
                                              _selectTime(context,Mon2);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(144),
                                          height: ScreenUtil().setHeight(55),
                                          child: LiteRollingSwitch(
                                            value: OnTue,
                                            textOn: days[3],
                                            textOff: days[3],
                                            colorOn: mainColor,
                                            textOffColor: Colors.white,
                                            textOnColor: Colors.white,
                                            colorOff: Colors.grey,
                                            iconOff: Icons.delete,
                                            iconOn: Icons.add,
                                            // animationDuration: const Duration(milliseconds: 300),
                                            onChanged: (bool state) {
                                              setState(() {
                                                OnTue = state;
                                                print(
                                                    "boooooooooooooooolllllllll ");
                                                print(OnTue);
                                              });
                                            },
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            onTap: () {},
                                          ),
                                        ),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Tue1,
                                            ontap: () {
                                              _selectTime(context,Tue1);
                                            }),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Tue2,
                                            ontap: () {
                                              _selectTime(context,Tue2);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(144),
                                          height: ScreenUtil().setHeight(55),
                                          child: LiteRollingSwitch(
                                            value: OnWen,
                                            textOn: days[4],
                                            textOff: days[4],
                                            colorOn: mainColor,
                                            textOffColor: Colors.white,
                                            textOnColor: Colors.white,
                                            colorOff: Colors.grey,
                                            iconOff: Icons.delete,
                                            iconOn: Icons.add,
                                            // animationDuration: const Duration(milliseconds: 300),
                                            onChanged: (bool state) {
                                              setState(() {
                                                OnWen = state;
                                                print(
                                                    "boooooooooooooooolllllllll ");
                                                print(OnWen);
                                              });
                                            },
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            onTap: () {},
                                          ),
                                        ),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Wen1,
                                            ontap: () {
                                              _selectTime(context,Wen1);
                                            }),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Wen2,
                                            ontap: () {
                                              _selectTime(context,Wen2);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(144),
                                          height: ScreenUtil().setHeight(55),
                                          child: LiteRollingSwitch(
                                            value: OnFri,
                                            textOn: days[5],
                                            textOff: days[5],
                                            colorOn: mainColor,
                                            textOffColor: Colors.white,
                                            textOnColor: Colors.white,
                                            colorOff: Colors.grey,
                                            iconOff: Icons.delete,
                                            iconOn: Icons.add,
                                            // animationDuration: const Duration(milliseconds: 300),
                                            onChanged: (bool state) {
                                              setState(() {
                                                OnFri = state;
                                                print(
                                                    "boooooooooooooooolllllllll ");
                                                print(OnFri);
                                              });
                                            },
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            onTap: () {},
                                          ),
                                        ),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Fri1,
                                            ontap: () {
                                              _selectTime(context,Fri1);
                                            }),
                                        ItemField(
                                            w: 150,
                                            h: 85,
                                            controller: Fri2,
                                            ontap: () {
                                              _selectTime(context,Fri2);
                                            }),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(144),
                                          height: ScreenUtil().setHeight(55),
                                          child: LiteRollingSwitch(
                                            value: OnThu,
                                            textOn: days[6],
                                            textOff: days[6],
                                            colorOn: mainColor,
                                            textOffColor: Colors.white,
                                            textOnColor: Colors.white,
                                            colorOff: Colors.grey,
                                            iconOff: Icons.delete,
                                            iconOn: Icons.add,
                                            // animationDuration: const Duration(milliseconds: 300),
                                            onChanged: (bool state) {
                                              setState(() {
                                                OnThu = state;
                                                print(
                                                    "boooooooooooooooolllllllll ");
                                                print(OnThu);
                                              });
                                            },
                                            onDoubleTap: () {},
                                            onSwipe: () {},
                                            onTap: () {},
                                          ),
                                        ),
                                        ItemField(
                                          w: 150,
                                          h: 85,
                                          controller: Thu1,
                                          ontap: () {
                                            _selectTime(context,Thu1);
                                          },
                                        ),
                                        ItemField(
                                          w: 150,
                                          h: 85,
                                          controller: Thu2,
                                          ontap: () {
                                            _selectTime(context,Thu2);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ) //
                          ],
                        ),
                      ),
                      Text(
                        "choose your teacher:",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(25), // smaller font size
                          color: mainColor,
                        ),
                      ),
                      DropdownButtonWidget(
                        h: 50.h,
                        w: 250.w,
                        items: dropdownItemsLevel,
                        selectedItem: selectedDropdownItemLevel,
                        onChanged: (String? selectedItem) {
                          selectedDropdownItemLevel = selectedItem;
                          print('Selected item: $selectedItem');
                        },
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
                                widget.id,
                                selectedDropdownItemLang!,
                                selectedDropdownItemLevel!,
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
  DateTime _selectedTime = DateTime.now();
  void _selectTime(BuildContext context,TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
    );

    if (pickedTime != null) {
      final int hour = pickedTime.hour;
      final int minute = pickedTime.minute;

      // Convert the pickedTime to 24-hour format
      int hour24 = hour;
      if (pickedTime.period == DayPeriod.pm && hour < 12) {
        hour24 = hour + 12;
      } else if (pickedTime.period == DayPeriod.am && hour == 12) {
        hour24 = 0;
      }

      if (hour24 >= 0 && hour24 <= 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Time'),
              content: Text('Please select a time after 6 AM.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        final DateTime selectedDateTime = DateTime(
          _selectedTime.year,
          _selectedTime.month,
          _selectedTime.day,
          hour24,
          minute,
        );

        setState(() {
          _selectedTime = selectedDateTime;
          controller.text = DateFormat.Hm().format(_selectedTime);
        });
      }
    }
  }









  // void _selectTime(BuildContext context,TextEditingController controller) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.fromDateTime(_selectedTime),
  //   );
  //
  //   if (pickedTime != null) {
  //     final int hour = pickedTime.hour;
  //     final int minute = pickedTime.minute;
  //
  //     // Convert the pickedTime to 24-hour format
  //     int hour24 = hour;
  //     if (pickedTime.period == DayPeriod.pm && hour < 12) {
  //       hour24 = hour + 12;
  //     } else if (pickedTime.period == DayPeriod.am && hour == 12) {
  //       hour24 = 0;
  //     }
  //
  //     final DateTime selectedDateTime = DateTime(
  //       _selectedTime.year,
  //       _selectedTime.month,
  //       _selectedTime.day,
  //       hour24,
  //       minute,
  //     );
  //
  //     setState(() {
  //       _selectedTime = selectedDateTime;
  //       controller.text = DateFormat.Hm().format(_selectedTime);
  //     });
  //   }
  // }










  // TimeOfDay _selectedTime = TimeOfDay.now();
  // TimeOfDay _startTime =
  //     TimeOfDay(hour: 6, minute: 0); // Replace with your desired start time
  // TimeOfDay _endTime =
  //     TimeOfDay(hour: 12, minute: 0); // Replace with your desired end time
  //
  // void _selectTime(BuildContext context) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: _selectedTime,
  //   );
  //
  //   if (pickedTime != null && _isTimeInRange(pickedTime)) {
  //     setState(() {
  //       _selectedTime = pickedTime;
  //     });
  //   } else {
  //     print("not valid");
  //     // Show an error message or feedback to the user
  //   }
  // }



  // bool _isTimeInRange(TimeOfDay time) {
  //   DateTime currentTime = DateTime.now();
  //   DateTime selectedDateTime = DateTime(
  //     currentTime.year,
  //     currentTime.month,
  //     currentTime.day,
  //     time.hour,
  //     time.minute,
  //   );
  //
  //   bool isBetween = selectedDateTime.isAfter(DateTime(
  //         currentTime.year,
  //         currentTime.month,
  //         currentTime.day,
  //         _startTime.hour,
  //         _startTime.minute,
  //       )) &&
  //       selectedDateTime.isBefore(DateTime(
  //         currentTime.year,
  //         currentTime.month,
  //         currentTime.day,
  //         _endTime.hour,
  //         _endTime.minute,
  //       ));
  //
  //   return isBetween;
  // }

  // Widget BuildListChooseTime(
  //     bool one,
  //     bool two,
  //     bool three,
  //     bool four,
  //     bool five,
  //     bool six,
  //     bool seven,
  //     TextEditingController Sat1,
  //     TextEditingController Sun1,
  //     TextEditingController Mon1,
  //     TextEditingController Tue1,
  //     TextEditingController Wen1,
  //     TextEditingController Thu1,
  //     TextEditingController Fri1,
  //     TextEditingController Sat2,
  //     TextEditingController Sun2,
  //     TextEditingController Mon2,
  //     TextEditingController Tue2,
  //     TextEditingController Wen2,
  //     TextEditingController Thu2,
  //     TextEditingController Fri2) {
  //   return ;
  // }

  // Widget BuildItemTimeChoose(String day, bool days, TextEditingController one,
  //     TextEditingController two) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         BuidSwitch(day, days),
  //         ItemField(
  //             w: 150,
  //             h: 85,
  //             controller: one,
  //             ontap: () {
  //               showTimePicker(
  //                 initialTime: TimeOfDay.now(),
  //                 context: context,
  //               ).then((value) {
  //                 setState(() {
  //                   // if (isValidTime(value!.format(context))) {
  //                   setState(() {
  //                     one.text = value!.format(context);
  //
  //                   });
  //                   // }else {
  //                   //   // Handle invalid time
  //                   //   showDialog(
  //                   //     context: context,
  //                   //     builder: (BuildContext context) {
  //                   //       return AlertDialog(
  //                   //         title: Text('Invalid Time'),
  //                   //         content: Text('Please select a valid time.'),
  //                   //         actions: [
  //                   //           TextButton(
  //                   //             onPressed: () {
  //                   //               Navigator.of(context).pop();
  //                   //             },
  //                   //             child: Text('OK'),
  //                   //           ),
  //                   //         ],
  //                   //       );
  //                   //     },
  //                   //   );
  //                   // }
  //                 });
  //               });
  //             }),
  //         ItemField(
  //             w: 150,
  //             h: 85,
  //             controller: two,
  //             ontap: () {
  //               showTimePicker(
  //                 initialTime: TimeOfDay.now(),
  //                 context: context,
  //               ).then((value) {
  //                 setState(() {
  //                   // if (isValidTime(value!.format(context))) {
  //                   setState(() {
  //                     two.text = value!.format(context);
  //                   });
  //                   // }else {
  //                   //   // Handle invalid time
  //                   //   showDialog(
  //                   //     context: context,
  //                   //     builder: (BuildContext context) {
  //                   //       return AlertDialog(
  //                   //         title: Text('Invalid Time'),
  //                   //         content: Text('Please select a valid time.'),
  //                   //         actions: [
  //                   //           TextButton(
  //                   //             onPressed: () {
  //                   //               Navigator.of(context).pop();
  //                   //             },
  //                   //             child: Text('OK'),
  //                   //           ),
  //                   //         ],
  //                   //       );
  //                   //     },
  //                   //   );
  //                   // }
  //                 });
  //               });
  //             }),
  //       ],
  //     ),
  //   );
  // }

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
            print("boooooooooooooooolllllllll ");
            print(t);
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
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        controller.text = formattedDate;
      });
    }
  }
  // void openTimePicker(BuildContext context) {
  //   showMaterialTimePicker(
  //     context: context,
  //     selectedTime: TimeOfDay.fromDateTime(selectedTime),
  //     onChanged: (time) {
  //       setState(() {
  //         selectedTime = DateTime(
  //           selectedTime.year,
  //           selectedTime.month,
  //           selectedTime.day,
  //           time.hour,
  //           time.minute,
  //         );
  //       });
  //     },
  //   );
  // }
}
