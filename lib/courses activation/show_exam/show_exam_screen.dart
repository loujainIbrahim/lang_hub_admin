import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/courses%20activation/show_exam/show_exam_cubit.dart';

import '../../core/color.dart';


class QuestionsScreen extends StatelessWidget {
  final int id;

  QuestionsScreen(this.id);

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

        title: Text(
          "Add exam",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
        ),
      ),
      body: BlocProvider(
        create: (context) => ShowExamCubit()..getExam(id),
        child: BlocConsumer<ShowExamCubit, ShowExamState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is ShowExamLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is ShowExamSuccessState) {
              final exam=state.showExamModel;

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: exam.data!.questions!.length,
                itemBuilder: (context, index) {
                  final question = exam.data!.questions![index];
                  bool is1=(question.correctChoise==1)?true:false;
                  bool is2=(question.correctChoise==2)?true:false;
                  bool is3=(question.correctChoise==3)?true:false;
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Question : "+question!.value!,
                            style:
                            TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16.0),

                          Container(
                            padding: EdgeInsets.all( 8),
                            color: (is2)?fillColorInTextFormField:Colors.white,
                            child: Row(

                              children: [
                                Text("answer1: "+question!.choise1!),
                                SizedBox(width: 50,),
                                Checkbox(
                                  // checkColor: Colors.green,
                                  activeColor: Colors.green,
                                  value: is1,
                                  onChanged: null,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all( 8),
                               color: (is1)?fillColorInTextFormField:Colors.white,
                            child: Row(
                              children: [
                                Text("answer2: "+question!.choise2!),
                                SizedBox(width: 50,),
                                Checkbox(
                                  // checkColor: Colors.green,
                                  activeColor: Colors.green,
                                  value: is2,
                                  onChanged: null,
                                ),

                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all( 8),
                            color: (is3)?fillColorInTextFormField:Colors.white,
                            child: Row(
                              children: [
                                Text("answer3: "+question!.choise3!),
                                SizedBox(width: 50,),
                                Checkbox(
                                  // checkColor: Colors.green,
                                  activeColor: Colors.green,
                                  value: is3,
                                  onChanged: null,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else return Container();
          },
        ),
      ),
    );
  }
}
