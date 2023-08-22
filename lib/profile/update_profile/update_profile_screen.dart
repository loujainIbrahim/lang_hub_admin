import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/profile/profile_cubit.dart';
import 'package:lang_hub_admin/profile/profile_model.dart';
import 'package:lang_hub_admin/profile/profile_screen.dart';

import '../../ institute information/select_languages_screen.dart';
import '../../core/widgets/default_button.dart';
import '../../core/widgets/snake_bar_widget.dart';
import '../../core/widgets/text_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  final ProfileModel profileModel;
  const UpdateProfileScreen({Key? key, required this.profileModel})
      : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String _base64Image = '';
  String _Institutebase64Image = '';
 late List checkListItems;
late  bool eng ;
  late  bool frensh ;
  late  bool grem ;
  late  bool spanish ;
  @override
  void initState() {
    super.initState();
     eng =
    (widget.profileModel!.data!.academyInfo!.english == 0) ? false : true;
     frensh =
    (widget.profileModel!.data!.academyInfo!.french == 0) ? false : true;
     grem =
    (widget.profileModel!.data!.academyInfo!.germany == 0) ? false : true;
     spanish =
    (widget.profileModel!.data!.academyInfo!.spanish == 0) ? false : true;
     checkListItems = [
      {"title": "english", "value": eng},
      {"title": "french", "value": frensh},
      {"title": "germany", "value": grem},
      {"title": "spanish", "value": spanish}
    ];
  }

  @override
  Widget build(BuildContext context) {
    File? _imageFile;
    TextEditingController oldPassword = new TextEditingController();
    TextEditingController newPassword = new TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController licensNumberController =
        TextEditingController();
    final TextEditingController FirstNameController = TextEditingController();
    final TextEditingController LastNameController = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController email = TextEditingController();
    nameController.text = widget.profileModel.data!.academyInfo!.name!;
    locationController.text = widget.profileModel.data!.academyInfo!.location!;
    descriptionController.text =
        widget.profileModel.data!.academyInfo!.description!;
    licensNumberController.text =
        widget.profileModel.data!.academyInfo!.licenseNumber!;
    FirstNameController.text =
        widget.profileModel.data!.personalInfo!.firstName!;
    LastNameController.text = widget.profileModel.data!.personalInfo!.lastName!;
    phone.text = widget.profileModel.data!.personalInfo!.phoneNumber!;
    email.text = widget.profileModel.data!.personalInfo!.user!.email!;
    final image = widget.profileModel!.data!.academyInfo!.image;
    final photo = widget.profileModel.data!.personalInfo!.photo;

    List multipleSelected = [];

    print(checkListItems[0]["value"]);
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccessState) {
            // ProfileCubit.get(context).getProfile();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
            if (state is ChangePasswordSuccessState) {
              ErrorSnackBar.show(context, "change successfully");
            }
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: fillColorInTextFormField,
            appBar: AppBar(
              iconTheme: IconThemeData(color: mainColor),
              elevation: 0,
              backgroundColor: fillColorInTextFormField,
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: fillColorInTextFormField,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: fillColorInTextFormField,
                                )),
                            width: ScreenUtil().setWidth(445),
                            height: ScreenUtil().setHeight(352),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
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
                                                      image: MemoryImage(
                                                          _imageData!),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                          child: myTextField(
                            height: 60.h,
                            width: 445.w,
                            maxxLines: 1,
                            controller: nameController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: myTextField(
                            height: 60.h,
                            width: 445.w,
                            maxxLines: 1,
                            controller: locationController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: myTextField(
                            height: 100.h,
                            width: 445.w,
                            maxxLines: 4,
                            controller: descriptionController,
                          ),
                        ),
                        myTextField(
                          height: 70.h,
                          width: 445.w,
                          maxxLines: 1,
                          controller: licensNumberController,
                        ),
                        Container(
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
                            )),
                      ],
                    ),
                    Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: fillColorInTextFormField,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: fillColorInTextFormField,
                          ),
                        ),
                        width: ScreenUtil().setWidth(445),
                        height: ScreenUtil().setHeight(340),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: (_imageDataInstitute != null)
                              ? Stack(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 547,
                                          height: 340,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: MemoryImage(
                                                  _imageDataInstitute!),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.add_a_photo,
                                                size: 30,
                                                color: mainColor,
                                              ),
                                              onPressed: _pickImageInstitute,
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
                                    onPressed: _pickImageInstitute,
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                        child: Text(
                          "Institute owner:",
                          style: TextStyle(
                              color: mainColor,
                              fontSize: ScreenUtil().setSp(28),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: myTextField(
                          height: 90.h,
                          width: 445.w,
                          maxxLines: 4,
                          controller: FirstNameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: myTextField(
                            height: 90.h,
                            width: 445.w,
                            maxxLines: 4,
                            controller: LastNameController,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: myTextField(
                            height: 90.h,
                            width: 445.w,
                            maxxLines: 4,
                            controller: phone,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: myTextField(
                            height: 90.h,
                            width: 445.w,
                            maxxLines: 4,
                            controller: email,
                          ),
                        ),
                      ),

                      // Container(height: 200,)
                    ]),
                    Column(children: [
                      Container(height: 200,),
                      Container(
                      width: ScreenUtil().setWidth(410),
                      height: ScreenUtil().setHeight(435),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myTextField(
                              height: 55,
                                controller: oldPassword,
                                hintText: "old password",
                                labelText: "old password"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myTextField(
                              height: 55,
                                controller: newPassword,
                                hintText: "new password",
                                labelText: "new password"),
                          ),
                          ConditionalBuilder(
                            condition: state is! ChangePasswordLoadingState,
                            fallback: (context)=>Center(child: CircularProgressIndicator(),),
                            builder:(context)=> defaultbutton(
                                height: 25,
                                fontSizeText: 14,
                                width: 250.w,
                                backround: Color(0xff210440),
                                text: 'change password',
                                textColor: Colors.white,
                                function: () {
                                  ProfileCubit.get(context).
                                      changePassowrd(
                                      oldPassword.text,
                                      newPassword.text);
                                }),
                          )
                        ],
                      ),
                    )],)
                  ],
                ),
                ConditionalBuilder(
                    condition: state is! UpdateProfileLoadingState,
                    fallback: (context) => Center(
                          child: Container(
                              height: 17,
                              width: 20,
                              child: CircularProgressIndicator()),
                        ),
                    builder: (context) {
                      return defaultbutton(
                          height: 25,
                          width: 210.w,
                          backround: Color(0xff210440),
                          text: 'update',
                          textColor: Colors.white,
                          function: () {
                            print(eng);
                            print(spanish);
                            print(frensh);
                            print(grem);

                            // context.read<ProfileCubit>().emit(Pro());
                            ProfileCubit.get(context).updateProfile(
                                photo: _base64Image,
                                firstName: FirstNameController.text,
                                lastName: LastNameController.text,
                                phone: phone.text,
                                academyName: nameController.text,
                                location: locationController.text,
                                newEmail: email.text,
                                description: descriptionController.text,
                                licensNum: licensNumberController.text,
                                english: ( checkListItems[0]["value"] == true) ? 1 : 0,
                                germany: ( checkListItems[2]["value"] == true) ? 1 : 0,
                                spanish: ( checkListItems[3]["value"] == true) ? 1 : 0,
                                french: ( checkListItems[1]["value"] == true) ? 1 : 0,
                                image: _Institutebase64Image);
                          });
                    })
              ],
            ),
          );
        },
      ),
    );
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

  html.File? _pickedFileInstitute;
  Uint8List? _imageDataInstitute;

  void _pickImageInstitute() async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();
    await input.onChange.first;
    _pickedFileInstitute = input.files!.first;
    final reader = html.FileReader();
    reader.readAsArrayBuffer(_pickedFileInstitute!);
    reader.onLoadEnd.listen((event) {
      setState(() {
        _imageDataInstitute = reader.result as Uint8List?;
      });
    });
  }

  Future<String> getImageAsBase64Ins() async {
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
