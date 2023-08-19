import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
  // String _selectedItem = 'English';
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

  List<String> _items = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  // List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wen", "Thu", "Fri"];
  String _selectedItem = 'English';
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  String? selectedDropdownItem;
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
            padding: const EdgeInsets.only(top: 10.0, left: 7, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: ScreenUtil().setWidth(1844),
                  height: ScreenUtil().setHeight(100),
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
                      child: (_imageData != null)
                          ? Stack(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 547,
                                      height: 390,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: MemoryImage(_imageData!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add_a_photo,
                                            size: 30,
                                            color: mainColor,
                                          ),
                                          onPressed: _pickImage,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: mainColor,
                                ),
                                onPressed: _pickImage,
                              ),
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
                    child: ItemField(
                        h: 100, controller: description, ontap: () {}),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "from:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Text("to:", style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                Container(
                  width: ScreenUtil().setWidth(480),
                  //  height: ScreenUtil().setHeight(160),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    print("boooooooooooooooolllllllll ");
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
                                  _selectTime(context, Sat1);
                                  print(selectedTime);
                                }),
                            ItemField(
                                w: 150,
                                h: 85,
                                controller: Sat2,
                                ontap: () {
                                  _selectTime(context, Sat2);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    print("boooooooooooooooolllllllll ");
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
                                  _selectTime(context, Sun1);
                                }),
                            ItemField(
                                w: 150,
                                h: 85,
                                controller: Sun2,
                                ontap: () {
                                  _selectTime(context, Sun2);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    print("boooooooooooooooolllllllll ");
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
                                  _selectTime(context, Mon1);
                                }),
                            ItemField(
                                w: 150,
                                h: 85,
                                controller: Mon2,
                                ontap: () {
                                  _selectTime(context, Mon2);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    print("boooooooooooooooolllllllll ");
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
                                  _selectTime(context, Tue1);
                                }),
                            ItemField(
                                w: 150,
                                h: 85,
                                controller: Tue2,
                                ontap: () {
                                  _selectTime(context, Tue2);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    print("boooooooooooooooolllllllll ");
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
                                  _selectTime(context, Wen1);
                                }),
                            ItemField(
                                w: 150,
                                h: 85,
                                controller: Wen2,
                                ontap: () {
                                  _selectTime(context, Wen2);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    print("boooooooooooooooolllllllll ");
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
                                  _selectTime(context, Fri1);
                                }),
                            ItemField(
                                w: 150,
                                h: 85,
                                controller: Fri2,
                                ontap: () {
                                  _selectTime(context, Fri2);
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    print("boooooooooooooooolllllllll ");
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
                                _selectTime(context, Thu1);
                              },
                            ),
                            ItemField(
                              w: 150,
                              h: 85,
                              controller: Thu2,
                              ontap: () {
                                _selectTime(context, Thu2);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "choose your teacher:",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(25), // smaller font size
                        color: mainColor,
                      ),
                    ),
                    DropdownButtonWidget(
                      items: dropdownItems,
                      selectedItem: selectedDropdownItem,
                      onChanged: (String? selectedItem) {
                        selectedDropdownItem = selectedItem;
                        print('Selected item: $selectedItem');
                      },
                    ),
                  ],
                ),
              ])
            ],
          ),
          elevate_button(
              width: 250,
              height: 50,
              backround: mainColor,
              text: 'Add',
              function: () {}),
        ],
      ),
    );
  }

  DateTime _selectedTime = DateTime.now();
  void _selectTime(
      BuildContext context, TextEditingController controller) async {
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

  html.File? _pickedFile;
  Uint8List? _imageData;
  void _pickImage() async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/';
    input.click();
    await input.onChange.first;
    _pickedFile = input.files!.first;
    final reader = html.FileReader();
    reader.readAsArrayBuffer(_pickedFile!);
    reader.onLoadEnd.listen((event) {
      setState(() {
        _imageData = reader.result as Uint8List?;
      });
    });
  }

  Future<String> getImageAsBase64() async {
    final completer = Completer<String>();
    final input = html.FileUploadInputElement();
    input.accept = 'image/';
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = html.FileReader();
      reader.readAsDataUrl(file);
      reader.onLoad.listen((event) {
        final encoded = reader.result as String;
        completer.complete(
            encoded.replaceFirst(RegExp('data:image/[^;]+;base64,'), ''));
      });
    });
    input.click();
    return completer.future;
  }
}
