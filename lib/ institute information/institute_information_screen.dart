import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';
import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lang_hub_admin/%20institute%20information/register_cubit.dart';
import 'package:lang_hub_admin/%20institute%20information/select_languages_screen.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/core/widgets/default_button.dart';
import 'package:lang_hub_admin/core/widgets/snake_bar_widget.dart';
import 'package:lang_hub_admin/core/widgets/text_button.dart';
import 'package:lang_hub_admin/core/widgets/text_field.dart';
import 'package:lang_hub_admin/home/home_screen.dart';
import 'package:lang_hub_admin/login/login_screen.dart';
import 'package:lang_hub_admin/waiting/waiting_screen.dart';

import '../core/shared.dart';
import '../core/widgets/alert.dart';
import '../profile/widgets/check_box_languages.dart';

class InstituteInformationScreen extends StatefulWidget {
  GlobalKey<FormState> _key = GlobalKey();
   InstituteInformationScreen({Key? key}) : super(key: key);

  @override
  State<InstituteInformationScreen> createState() =>
      _InstituteInformationScreenState();
}

class _InstituteInformationScreenState
    extends State<InstituteInformationScreen> {
  late List checkListItems;
  @override
  void initState() {
    super.initState();
    checkListItems = [
      {"title": "english", "value": false},
      {"title": "french", "value": false},
      {"title": "germany", "value": false},
      {"title": "spanish", "value": false}
    ];
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController firt_name = new TextEditingController();
    TextEditingController last_name = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController phone = new TextEditingController();
    TextEditingController password = new TextEditingController();
    TextEditingController institute_name = new TextEditingController();
    TextEditingController place_of_the_institute = new TextEditingController();
    TextEditingController license_number = new TextEditingController();
    TextEditingController description = new TextEditingController();
    int englsih = 1;
    int germeny = 1;
    int french = 1;
    int spanish = 1;
    List multipleSelected = [];

    bool? isChecked = true;
    /////////////////listImages

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            print(state.error);
          } else if (state is RegisterSuccessState) {
            print("success");
            if (state.registerModel!.token! != null) {
              html.window.localStorage['auth_token'] =
                  state.registerModel!.token!;
              token=state.registerModel!.token!;
              ErrorSnackBar.show(context, state.registerModel!.massage!);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WaitingScreen()));
            } else {
              showAlertDialog(context, "email or password not correct");
            }
          } else if (state is RegisterErrorState) {
            showAlertDialog(context, "email or password not correct");
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              body: Form(
                key: widget._key,
                child: SingleChildScrollView(

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Please enter your institute information",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: Text(
                                  "Select the image that you want to appear on the other",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 445.w,
                                    height: 150,
                                    child: GridView.count(
                                      childAspectRatio: 65 / 30,
                                      crossAxisCount: 2,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      children: List.generate(
                                        checkListItems.length,
                                            (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(checkListItems[index]["title"]),
                                              Checkbox(
                                                activeColor: Colors.green,
                                                value: checkListItems[index]["value"],
                                                onChanged: (value) {
                                                  setState(() {
                                                    checkListItems[index]["value"] =
                                                        value;
                                                    if (multipleSelected.contains(
                                                        checkListItems[index])) {
                                                      multipleSelected.remove(
                                                          checkListItems[index]);
                                                    } else {
                                                      multipleSelected
                                                          .add(checkListItems[index]);
                                                    }
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )))

                            ,SizedBox(height: 10),
                            Container(
                              width: 520.w,
                              height: 297.h,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 560.w,
                                    height: 550.h,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: mainColor,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: (Listimages!.length > 0)
                                            ? Container(
                                                width: 520,
                                                height: 297,
                                                child: GridView.count(
                                                  crossAxisCount:
                                                      Listimages!.length,
                                                  children:
                                                      Listimages!.map((image) {
                                                    return Image.memory(
                                                      image,
                                                      fit: BoxFit.cover,
                                                    );
                                                  }).toList(),
                                                ),
                                              )
                                            : Container(),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    bottom: 5,
                                    child: Container(
                                      width: 121.w,
                                      height: 106.h,
                                      child: IconButton(
                                        onPressed: () {
                                          _pickImages();
                                        },
                                        icon: Icon(Icons.add_a_photo),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: mainColor,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Choose the type of courses offered by your institute:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: mainColor)),
                            ),
                            Container(
                              width: 520.w,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 1,
                                  color: mainColor,
                                ),
                              ),
                              child: (_imageData != null)
                                  ? Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: MemoryImage(_imageData!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: myTextField(
                                  height: 55,
                                  controller: phone,
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: "phone number ",
                                  validatorValue: "must be not empty"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: myTextField(
                                  height: 55,
                                  controller: password,
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "password",
                                  validatorValue: "must be not empty",
                                  suffixIcon: Icon(Icons.remove_red_eye)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, bottom: 10),
                              child: myTextField(
                                height: 50,
                                controller: institute_name,
                                prefixIcon: Icon(Icons.business),
                                labelText: "institute name",
                                validatorValue: "must be not empty",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextField(
                                height: 50,
                                controller: place_of_the_institute,
                                prefixIcon: Icon(Icons.home),
                                labelText: "Place of the institute ",
                                validatorValue: "must be not empty",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: myTextField(
                                height: 50,
                                controller: license_number,
                                prefixIcon: Icon(Icons.bookmark),
                                labelText: "license number",
                                validatorValue: "must be not empty",
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, top: 5.0, right: 10.0, bottom: 0.0),
                              // padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: new BorderRadius.circular(10.0)),

                              child: ConstrainedBox(
                                //  fit: FlexFit.loose,
                                constraints: BoxConstraints(
                                  maxHeight: 100,
                                  //when it reach the max it will use scroll
                                  maxWidth: 600.w,
                                ),
                                child: TextFormField(
                                  cursorColor: mainColor,
                                  style: TextStyle(color: Color(0xff210440)),

                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.symmetric(vertical: 16),
                                    filled: true,
                                    fillColor: fillColorInTextFormField,
                                    labelText: "description",
                                    labelStyle: TextStyle(color: mainColor),
                                    focusedBorder: OutlineInputBorder(
                                        // borderRadius: BorderRadius.circular(30.0),
                                        borderSide: BorderSide(
                                            width: 2.w, color: mainColor)),
                                    suffixIconColor: mainColor,
                                    prefixIconColor: mainColor,
                                    hintText: "Description",
                                    hintStyle: TextStyle(color: mainColor),
                                    enabledBorder: OutlineInputBorder(
                                      //  borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                        color: mainColor,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  //cursorColor: mainColor,

                                  controller: description,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "this must be do\'nt empty";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  minLines: 5,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Container(
                              width: 500,
                              height: 57,
                              padding: EdgeInsets.all(10),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  myTextField(
                                    maxxLines: 1,
                                    height: 80,
                                    width: 200,
                                    controller: firt_name,
                                    labelText: "First name",
                                    validatorValue: "must be not empty",
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  myTextField(
                                    maxxLines: 1,
                                    width: 200,
                                    height: 65,
                                    controller: last_name,
                                    labelText: "Last name",
                                    validatorValue: "must be not empty",
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: myTextField(
                                  height: 55,
                                  controller: email,
                                  prefixIcon: Icon(Icons.email),
                                  labelText: "Email",
                                  validatorValue: "must be not empty"),
                            ),
                            Container(
                              width: 463.6,
                              child: Text(
                                  "check your information and the information "
                                      "of your institute before joining so that"
                                      " we don\'t prolong your response. ",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              children: [
                                Text(
                                  "are you have account?",
                                  style:
                                  TextStyle(fontSize: ScreenUtil().setSp(23)),
                                ),
                                DefaultTextButton(
                                    number: 23,
                                    text: 'Login',
                                    function: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => LoginScreen()));
                                    })
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      // height: 50.h,
                      // width: double.infinity,
                      child: ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          fallback: (context) => Center(
                                child: CircularProgressIndicator(),
                              ),
                          builder: (context) => defaultbutton(
                              textColor: Colors.white,
                              backround: mainColor,
                              text: "join in our application",
                              function: () {
                                if (widget._key!.currentState!.validate()) {
                                //  print(_imageDataList);
                                 // print(Listimages);
                                  var num = int.parse(license_number.text);
                                  print("firt_name" + firt_name.text);
                                  print("last name" + last_name.text);
                                  print("institute" + institute_name.text);
                                  print("place_of_the_institute" +
                                      place_of_the_institute.text);
                                  print(num.toString());
                                  print("description" + description.text);
                                  print("email" + email.text);
                                  print("phone" + phone.text);
                                  print("password" + password.text);
                                  print("this is _imageData");
                                  // print(_imageData);
                                  // print("_imageDataList");
                                  // print(_imageDataList);
                                  print("_pickedFiles");
                                  // print(_pickedFiles);
                                  RegisterCubit.get(context).userRegister(
                                      first_name: firt_name.text,
                                      last_name: last_name.text,
                                      name: institute_name.text,
                                      location: place_of_the_institute.text,
                                      license_number: num,
                                      description: description.text,
                                      email: email.text,
                                      phone_number: phone.text,
                                      password: password.text,
                                      imageData: _imageData,
                                      imageList: _imageDataList!,
                                      files: _pickedFiles,
                                      eng: englsih,
                                      frensh: french,
                                      spanish: spanish,
                                      germeny: germeny);
                                }
                              })),
                    )
                  ],
                ),
            ),
              ),
          );
        },
      ),
    );
  }

  List<html.File>? _pickedFiles;
  List<Uint8List>? _imageDataList;
  List<Uint8List> Listimages = [];

  void _pickImages() async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.multiple = true;
    input.click();
    await input.onChange.first;
    _pickedFiles = input.files!;

    _imageDataList = [];

    for (var file in _pickedFiles!) {
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      await reader.onLoadEnd.first;
      _imageDataList!.add(reader.result as Uint8List);

      // Update the Listimages list
      setState(() {
        Listimages.add(reader.result as Uint8List);
      });
    }
  }

  html.File? _pickedFile;
  Uint8List? _imageData;

  void _pickImage() async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
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
}
