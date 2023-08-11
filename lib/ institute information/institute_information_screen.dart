import 'dart:async';
import 'dart:html' as html;
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
import 'package:lang_hub_admin/core/widgets/text_button.dart';
import 'package:lang_hub_admin/core/widgets/text_field.dart';
import 'package:lang_hub_admin/home/home_screen.dart';
import 'package:lang_hub_admin/login/login_screen.dart';

class InstituteInformationScreen extends StatefulWidget {
  const InstituteInformationScreen({Key? key}) : super(key: key);

  @override
  State<InstituteInformationScreen> createState() =>
      _InstituteInformationScreenState();
}

class _InstituteInformationScreenState
    extends State<InstituteInformationScreen> {
  List<File> selectedImages = [];
  String _base64Image = '';
  List<String> images = [];
  final picker = ImagePicker();
  File? _imageFile;
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
    bool? isChecked = true;
    GlobalKey<FormState> _key = GlobalKey();
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    if(state is RegisterErrorState){
      print(state.error);
    }
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _key,
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                          "Select the image that you want to appear on the other",
                          style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 450.w,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        child: (_base64Image.isNotEmpty)
                            ? Image.memory(
                                base64Decode(_base64Image),
                                width: 200,
                                height: 200,
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
                              )),
                    Container(
                      width: 500,
                      height: 57,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          myTextField(
                            height: 57,
                            width: 200,
                            controller: firt_name,
                            labelText: "First name",
                            validatorValue: "must be not empty",
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          myTextField(
                            width: 200,
                            height: 57,
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
                          style: TextStyle(fontSize: ScreenUtil().setSp(23)),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
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
                                  child: (Listimages.length > 0)
                                      ? Container(
                                          width: 520.w,
                                          height: 297.h,
                                          child: GridView.count(
                                            crossAxisCount: Listimages.length,
                                            children: Listimages.map((image) {
                                              return Image.memory(
                                                base64Decode(image),
                                                fit: BoxFit.cover,
                                              );
                                            }).toList(),
                                          ),
                                        )
                                      : Container()),
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
                                    getImages();
                                  },
                                  icon: Icon(Icons.add_a_photo)),
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
                          border: Border.all(color: Colors.black, width: 2),
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
                              filled: true,
                              fillColor: fillColorInTextFormField,
                              labelStyle: TextStyle(color: mainColor),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide:
                                      BorderSide(width: 2.w, color: mainColor)),
                              hintStyle: TextStyle(color: mainColor),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xFF210440),
                                  ))),
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
                    Text(
                        "Choose the type of courses offered by your institute:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 250, height: 200, child: CheckBoxExample()),
                    )
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
                builder:(context) => defaultbutton(
                    textColor: Colors.white,
                    backround: mainColor,
                    text: "join in our application",
                    function: () {
                      if (_key!.currentState!.validate()) {
                        var num = int.parse(license_number.text);
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
                            photo: base64Image,
                            photos: Listimages
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    ));
  },
),
);
  }

  List<String> Listimages = <String>[]; /////////////////listImages
  Future<List<String>?> getImages() async {
    final pickedFiles = await picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    if (pickedFiles == null || pickedFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nothing is selected')),
      );
      return [];
    }

    for (var i = 0; i < pickedFiles.length; i++) {
      final bytes = await pickedFiles[i].readAsBytes();
      final encoded = base64Encode(bytes);
      Listimages?.add(encoded);
    }
    print(Listimages);
    return Listimages;
  }

  String? _imageUrl;
  String? image;
  late String base64Image; ////////////////////////image
  void _pickImage() async {
    base64Image = await getImageAsBase64();
    setState(() {
      _base64Image = base64Image!;
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

  // void ppickImage() async {
  //   final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //       final Uint8List bytes =  _imageFile!.readAsBytes() as Uint8List;
  //       final String base64Image = base64Encode(bytes);
  //        print(base64Image);
  //     });
  //   }
  // }
}
