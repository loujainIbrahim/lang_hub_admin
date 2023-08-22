import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxExample extends StatefulWidget {
  final List<Map<String, dynamic>> defaultCheckListItems; // Add this line

  const CheckBoxExample({
    Key? key,
    required this.defaultCheckListItems , // Set a default list of items
  }) : super(key: key);

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  List multipleSelected = [];
  List checkListItems = [];

  @override
  void initState() {
    super.initState();
    checkListItems = List.from(widget.defaultCheckListItems); // Initialize the list with the default values
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 65 / 30,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        checkListItems.length,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(checkListItems[index]["title"]),
              Checkbox(
                activeColor: Colors.green,
                value: checkListItems[index]["value"],
                onChanged: (value) {
                  setState(() {
                    checkListItems[index]["value"] = value;
                    if (multipleSelected.contains(checkListItems[index])) {
                      multipleSelected.remove(checkListItems[index]);
                    } else {
                      multipleSelected.add(checkListItems[index]);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}