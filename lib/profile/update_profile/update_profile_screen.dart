import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/profile/profile_cubit.dart';
import 'package:lang_hub_admin/profile/profile_model.dart';
import 'package:lang_hub_admin/profile/update_profile/update_profile_cubit.dart';
import 'package:lang_hub_admin/profile/widgets/check_box_languages.dart';

import '../../ institute information/select_languages_screen.dart';
import '../../core/widgets/default_button.dart';
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
  @override
  Widget build(BuildContext context) {
    File? _imageFile;
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
    final eng =
        (widget.profileModel!.data!.academyInfo!.english == 0) ? true : false;
    final frensh =
        (widget.profileModel!.data!.academyInfo!.french == 0) ? true : false;
    final grem =
        (widget.profileModel!.data!.academyInfo!.germany == 0) ? true : false;
    final spanish =
        (widget.profileModel!.data!.academyInfo!.spanish == 0) ? true : false;
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
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
                                  child: Stack(
                                    children: [
                                      (_Institutebase64Image.isNotEmpty)
                                          ? Image.memory(
                                              base64Decode(
                                                  _Institutebase64Image),
                                              fit: BoxFit.cover,
                                            )
                                          : (image == "" || image == null)
                                              ? Container(
                                                  color: Colors.blue,
                                                )
                                              : Image.network(
                                                  image!,
                                                  fit: BoxFit.cover,
                                                ),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () {
                                            // Handle photo selection here
                                            _pickImageforinstite();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.add_a_photo,
                                              color: mainColor,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                          child: CheckBoxExample(
                            defaultCheckListItems: [
                              {
                                "id": 0,
                                "value": (eng == 0) ? true : false,
                                "title": "English",
                              },
                              {
                                "id": 1,
                                "value": (spanish == 0) ? true : false,
                                "title": "Spanish",
                              },
                              {
                                "id": 2,
                                "value": (frensh == 0) ? true : false,
                                "title": "French",
                              },
                              {
                                "id": 3,
                                "value": (grem == 0) ? true : false,
                                "title": "Germany",
                              },
                            ],
                          ),
                        ),
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
                        height: ScreenUtil().setHeight(362),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Stack(
                            children: [
                              (_base64Image.isNotEmpty)
                                  ? Image.memory(
                                      base64Decode(_base64Image),
                                      fit: BoxFit.cover,
                                    )
                                  : (photo == "" || photo == null)
                                      ? Container(
                                          color: Colors.blue,
                                        )
                                      : Image.network(
                                          photo!,
                                          fit: BoxFit.cover,
                                        ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: InkWell(
                                  onTap: () {
                                    // Handle photo selection here
                                    _pickImage();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: mainColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                            UpdateProfileCubit.get(context).updateProfile(
                                photo: _base64Image,
                                firstName:  FirstNameController.text,
                                lastName: LastNameController.text,
                                phone: phone.text,
                                academyName: nameController.text,
                                location:  locationController.text,
                                newEmail: email.text,
                                description: descriptionController.text,
                                licensNum: licensNumberController.text,
                                english: (eng == false) ? 0 : 1,
                                germany: (grem == false) ? 0 : 1,
                                spanish: (spanish == false) ? 0 : 1,
                                french: (frensh == false) ? 0 : 1,
                                image: _Institutebase64Image
                                );
                          });
                    })
              ],
            ),
          );
        },
      ),
    );
  }

  String? base64Image;
  void _pickImage() async {
    base64Image = await getImageAsBase64();
    setState(() {
      _base64Image = base64Image!;
      print("$_base64Image ");
    });
  }

  String? imageInstitues64;
  void _pickImageforinstite() async {
    imageInstitues64 = await getImageAsBase64();
    setState(() {
      _Institutebase64Image = imageInstitues64!;
      print("$_base64Image ");
    });
  }

  Future<String> getImageAsBase64() async {
    final completer = Completer<String>();
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
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
