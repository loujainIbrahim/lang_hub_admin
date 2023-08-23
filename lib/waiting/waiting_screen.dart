import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/home/home_screen.dart';

import '../core/network/DioHelper.dart';
import 'cubit_waiting/message_cubit.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkMessageStatus();
  }

  void _checkMessageStatus() async {
    // Make the API call to get the response message
    // Replace this with your actual API call
    final response = await DioHelper.getData(url: "academy-admin/profile/accepted");

    setState(() {
      _isLoading = false;
    });
 print(response.data["message"]);
    if (response.data["message"] == 'approved') {
      // Navigate to the home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Wait until you are accepted",
              style: TextStyle(fontSize: 25, color: mainColor),
            ),
            Container(
              child: Image.asset("assets/images/ll.jpg"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _checkMessageStatus();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}