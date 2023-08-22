import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/core/widgets/snake_bar_widget.dart';
import 'package:lang_hub_admin/core/widgets/text_field.dart';
import 'package:lang_hub_admin/profile/profile_cubit.dart';
import 'package:lang_hub_admin/profile/update_profile/update_profile_screen.dart';
import 'package:lang_hub_admin/profile/widgets/check_box_languages.dart';

import '../core/widgets/default_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit()..getProfile(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
          if (state is ProfileSuccessState) {
            print("succcccccesss profilllllllle");

          }
          // TODO: implement listener
        }, builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileSuccessState) {
            final profileModel = state.profileModel;

            final image = profileModel!.data!.academyInfo!.image;
            print(image);
            final photo = profileModel.data!.personalInfo!.photo;
            print(photo);
            final eng =
                (profileModel!.data!.academyInfo!.english == 0) ? false : true;
            final frensh =
                (profileModel!.data!.academyInfo!.french == 0) ? false : true;
            final grem =
                (profileModel!.data!.academyInfo!.germany == 0) ? false : true;
            final spanish =
                (profileModel!.data!.academyInfo!.spanish == 0) ? false : true;
            return Scaffold(
              backgroundColor: fillColorInTextFormField,
              appBar: AppBar(
                iconTheme: IconThemeData(color: mainColor),
                elevation: 0,
                backgroundColor: fillColorInTextFormField,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 7),
                    child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateProfileScreen(
                                            profileModel: profileModel,
                                          )));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: mainColor,
                            ))),
                  )
                ],
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: fillColorInTextFormField,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: fillColorInTextFormField,
                              )),
                          width: ScreenUtil().setWidth(445),
                          height: ScreenUtil().setHeight(362),
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              child: (image == "" || image == null)
                                  ? Container(
                                      color: Colors.blue,
                                    )
                                  : Image.network(
                                      image!,
                                      fit: BoxFit.cover,
                                    ))),
                      Text(
                        profileModel!.data!.academyInfo!.name!,
                        maxLines: 1,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "location: " +
                            profileModel!.data!.academyInfo!.location!,
                        maxLines: 1,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: ScreenUtil().setSp(27),
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(321),
                        child: Text(
                          "description: " +
                              profileModel!.data!.academyInfo!.description!,
                          maxLines: 4,
                          style: TextStyle(
                              color: mainColor,
                              fontSize: ScreenUtil().setSp(25)),
                        ),
                      ),
                      Text(
                        "license number: " +
                            profileModel!.data!.academyInfo!.licenseNumber!,
                        maxLines: 1,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: ScreenUtil().setSp(24),
                            fontWeight: FontWeight.w400),
                      ),
                      LanguageInDetailsInstitute(
                          english: eng,
                          french: frensh,
                          spanish: spanish,
                          germany: grem),
                    ],
                  ),
                  Column(children: [
                    Container(
                        decoration: BoxDecoration(
                            color: fillColorInTextFormField,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: fillColorInTextFormField,
                            )),
                        width: ScreenUtil().setWidth(445),
                        height: ScreenUtil().setHeight(362),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            child: (photo == "" || photo == null)
                                ? Container(
                                    color: Colors.blue,
                                  )
                                : Image.network(
                                    photo!,
                                    fit: BoxFit.cover,
                                  ))),
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
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                      child: Text(
                        "First name: " +
                            profileModel!.data!.personalInfo!.firstName!,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                      child: Text(
                        "Last name: " +
                            profileModel!.data!.personalInfo!.lastName!,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                      child: Text(
                        profileModel!.data!.personalInfo!.phoneNumber!,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        profileModel!.data!.personalInfo!.user!.email!,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    // Container(height: 200,)
                  ]),
                ],
              ),
            );
          } else
            return Container();
        }));
  }
}
