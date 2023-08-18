import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/joining_requests_from_teachers/requests_teachers_cubit/requests_teachers_cubit.dart';
import 'package:lang_hub_admin/joining_requests_from_teachers/requests_teachers_details/requests_teachers_details_screen.dart';
import 'package:lang_hub_admin/joining_requests_from_teachers/requests_teachers_model.dart';

class JoiningRequestsScreen extends StatefulWidget {
  const JoiningRequestsScreen({Key? key}) : super(key: key);

  @override
  State<JoiningRequestsScreen> createState() => _JoiningRequestsScreenState();
}

class _JoiningRequestsScreenState extends State<JoiningRequestsScreen> {
  late RequestsTeachersCubit requestsTeachersCubit;
  RequestsTeachersModel? requestTeacher;
  @override
  void initState() {
    super.initState();
    requestsTeachersCubit = RequestsTeachersCubit();
    requestsTeachersCubit.getRequestTeachers();
  }

  // @override
  // void dispose() {
  //   requestsTeachersCubit.close(); // Close the RequestsTeachersCubit when the widget is disposed
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => requestsTeachersCubit,
      child: BlocConsumer<RequestsTeachersCubit, RequestsTeachersState>(
        listener: (context, state) {
          if (state is ApproveRequestsTeachersSuccessState) {
            requestsTeachersCubit.getRequestTeachers();
            requestTeacher = requestsTeachersCubit.requestsTeachersModel;
            print("success");
            // detailModel = CourseActivationDetailsCubit.get(context)
            //     .detailActivationModel;
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is RequestsTeachersLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RequestsTeachersSuccessState) {
            requestTeacher = state.requestsTeachersModel;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return BuildListViewItem(
                          context, requestTeacher!.data![index]);
                    },
                    itemCount: requestTeacher!.data!.length,
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget BuildListViewItem(context, Data data) {
  return GestureDetector(
    onTap: () {
      showRequestTeachersDetailsDialog(context,data);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Container(
        width: ScreenUtil().setWidth(900),
        height: ScreenUtil().setHeight(251),
        decoration: BoxDecoration(
          color: fillColorInTextFormField,
          border: Border.all(
            color: mainColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(272),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: (data.photo == "" || data.photo == null)
                      ? Image.network(
                          data.photo!,
                          fit: BoxFit.cover,
                        )
                      : Container()),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "First name: " + data.firstName!,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(28), // smaller font size
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Last name: " + data.lastName!,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(28), // smaller font size
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  data.phoneNumber!,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(22), // smaller font size
                    color: Colors.black,
                  ),
                ),
                // Text(
                //   data.emai!,
                //   style: TextStyle(
                //       fontSize: ScreenUtil().setSp(18), // smaller font size
                //       color: Colors.black),
                // ),
                Text(
                  'The Language :English',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(22), // smaller font size
                      color: Colors.black),
                )
              ],
            ),
            Spacer(),
            Container(
              width: ScreenUtil().setWidth(244),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10, bottom: 10),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green, // set the background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // set the border radius
                              ),
                              minimumSize: Size(
                                  ScreenUtil().setWidth(103),
                                  ScreenUtil()
                                      .setHeight(30)), // set the minimum size
                            ),
                            onPressed: () {
                              RequestsTeachersCubit.get(context)
                                  .approveTeacher(data!.id!);
                            },
                            child: Text(
                              style: TextStyle(color: Colors.white),
                              "Approve",
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25.0), // set the border radius
                            ),
                            minimumSize: Size(
                                ScreenUtil().setWidth(103),
                                ScreenUtil()
                                    .setHeight(30)), // set the minimum size
                          ),
                          onPressed: () {},
                          child: Text("Reject",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
