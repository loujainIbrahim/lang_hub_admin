import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/core/color.dart';
import 'package:lang_hub_admin/feedback/feedback_cubit.dart';

List<String> feedBack = <String>[
  "rgdffdbfd fbdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergrrgdffdbfdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergrrgdffdbfdfbdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergrrgdffdbfdfbdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergr",
  "rgdffdbfd fbdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergrrgdffdbfd fbdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergrrgdffdbfdfbdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergrrgdffdbfdfbdfbdfdf gbdfrhyjk l.;o.o scscasfcvbfdbf bgfnfgjnf ghthtfnfgb bfgnfgnfgcwd k.o;oi fbdfd,.l;o dfrg dfergr",
  "fdverbrebweb fvkmvld, llllllllllllllll"
];

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedbackCubit()..getFeedback(),
      child: BlocConsumer<FeedbackCubit, FeedbackState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is FeedbackErrorState)print(state.error);
          if(state is FeedbackSuccessState) print(state.feedbackModel);
        },
        builder: (context, state) {
          final feedbackModel = FeedbackCubit.get(context).feedbackModel;
          return ConditionalBuilder(
            condition: state is! FeedbackLoadingState,
            fallback: (context) =>
                Center(child: CircularProgressIndicator()),
            builder: (context) {

              return Scaffold(
                body: GridView.builder(
                  itemCount: feedbackModel?.data?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final data = feedbackModel?.data?[index];
                    return Padding(
                      padding:
                      const EdgeInsets.only(top: 15, right: 15, left: 15),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                                color: fillColorInTextFormField,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: mainColor)),
                            width: ScreenUtil().setWidth(442),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    data?.value ?? "",
                                    style: TextStyle(
                                        fontSize: 20, color: mainColor),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 15, top: 5, bottom: 3),
                                    width: double.infinity,
                                    child: Text(
                                      "10/10/2023",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: mainColor,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
