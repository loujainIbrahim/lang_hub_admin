import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lang_hub_admin/exams/add_exams/add_exam_cubit.dart';

import '../../core/color.dart';
import '../../core/widgets/drop_list_item.dart';
import '../../core/widgets/elevate_button.dart';
import '../../core/widgets/field_item_choose.dart';
import 'add_exam_model.dart';

class Question {
  final String questionText;
  final Answer answer1;
  final Answer answer2;
  final Answer answer3;

  Question({
    required this.questionText,
    required this.answer1,
    required this.answer2,
    required this.answer3,
  });
}

class Answer {
  final String answerText;
  final bool answer;

  Answer({
    required this.answerText,
    required this.answer,
  });
}

List<Question> questions = [];

class AddExamsScreen extends StatefulWidget {
   int id;
   AddExamsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<AddExamsScreen> createState() => _AddExamsScreenState(id);
}

class _AddExamsScreenState extends State<AddExamsScreen> {
  final int id;
  _AddExamsScreenState(this.id);
  List<String> _items = [
    'English',
    'Spanish',
    'French',
    'Germany',
  ];
  int? correct;
  List<QuestionModel> exam = [];
  String _selectedItem = 'English';
  TextEditingController question = new TextEditingController();
  TextEditingController answer1 = new TextEditingController();
  TextEditingController answer2 = new TextEditingController();
  TextEditingController answer3 = new TextEditingController();
  bool ans1 = false;
  bool ans2 = false;
  bool ans3 = false;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExamCubit(),
      child: BlocConsumer<AddExamCubit, AddExamState>(
        listener: (context, state) {
          if(state is AddExamSuccessState)
            print(state.responseAddExamModel.message);
          else if(state
           is AddExamErrorState)print(state.error);
          // TODO: implement listener
        },
        builder: (context, state) {
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
              leading: Image.asset(
                "assets/images/home_logo.png",
                fit: BoxFit.fill,
              ),
              title: Text(
                "Add exam",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "choose your teacher:",
                                style: TextStyle(
                                  fontSize: ScreenUtil()
                                      .setSp(25), // smaller font size
                                  color: mainColor,
                                ),
                              ),
                            ),
                            DropListItem(
                              item: _selectedItem,
                              s: _items,
                              h: 65,
                              w: 549,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "choose level",
                                style: TextStyle(
                                  fontSize: ScreenUtil()
                                      .setSp(25), // smaller font size
                                  color: mainColor,
                                ),
                              ),
                            ),
                            DropListItem(
                              item: _selectedItem,
                              s: _items,
                              h: 65,
                              w: 549,
                            ),
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          questions.length != 0
                              ? Container(
                                  height: 200,
                                  width: 600,
                                  child: ListView.builder(
                                      itemCount: questions.length,
                                      itemBuilder: (context, index) {
                                        return ItemListQuestion(
                                            questions[index],
                                            index,
                                            exam[index]);
                                      }),
                                )
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Add question",
                              style: TextStyle(
                                fontSize:
                                    ScreenUtil().setSp(25), // smaller font size
                                color: mainColor,
                              ),
                            ),
                          ),
                          ItemField(
                              w: 1170,
                              h: 77,
                              controller: question,
                              ontap: () {}),
                          AnswerWidget("answer 1", answer1, ans1, (value) {
                            setState(() {
                              ans1 = value!;

                              ans2 = false;
                              ans3 = false;
                            });
                          }),
                          AnswerWidget("answer 2", answer2, ans2, (value) {
                            setState(() {
                              ans2 = value!;
                              ans1 = false;
                              ans3 = false;
                            });
                          }),
                          AnswerWidget("answer 3", answer3, ans3, (value) {
                            setState(() {
                              ans3 = value!;

                              ans2 = false;

                              ans1 = false;
                            });
                          })
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 20.0, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Spacer(),
                              elevate_button(
                                  width: 237,
                                  height: 58,
                                  backround: mainColor,
                                  text: 'add question',
                                  function: () {
                                    setState(() {
                                      Answer aanswer1 = new Answer(
                                          answerText: answer1.text,
                                          answer: ans1);
                                      Answer aanswer2 = new Answer(
                                          answerText: answer2.text,
                                          answer: ans2);
                                      Answer aanswer3 = new Answer(
                                          answerText: answer3.text,
                                          answer: ans3);
                                      Question qquestion = new Question(
                                          questionText: question.text,
                                          answer1: aanswer1,
                                          answer2: aanswer2,
                                          answer3: aanswer3);
                                      AddToQuestions(qquestion);
                                      if (ans1 == true)
                                        correct = 1;
                                      else if (ans2 == true)
                                        correct = 2;
                                      else
                                        correct = 3;
                                      QuestionModel questionModel =
                                          QuestionModel(
                                              value: question.text,
                                              choise1: answer1.text,
                                              choise2: answer2.text,
                                              choise3: answer3.text,
                                              correctChoise: correct!);
                                      exam.add(questionModel);
                                      question.clear();
                                      answer1.clear();
                                      answer2.clear();
                                      answer3.clear();
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 20.0, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              ConditionalBuilder(
                                condition: state is! AddExamLoadingState,
                                fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                builder: (context) => elevate_button(
                                    width: 237,
                                    height: 58,
                                    backround: mainColor,
                                    text: 'Done',
                                    function: () {
                                      ExamModel exams = ExamModel(questions:exam);
                                      List<Map<String, dynamic>> jsonData = exams.toJson();
                                      print(jsonData);
                                      AddExamCubit.get(context)
                                          .Addexam(id, jsonData);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget ItemListQuestion(
      Question question, int index, QuestionModel questionModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${index + 1}- ',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    color: mainColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(question.questionText,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: mainColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 40,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      RemoveFromQuestions(question);

                      exam.remove(questionModel);
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: mainColor,
                    size: 35,
                  ))
            ],
          ),
          Row(
            children: [
              Text(' - ' + question.answer1.answerText,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: mainColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
              Checkbox(
                value: question.answer1.answer,
                onChanged: null,
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            children: [
              Text(' - ' + question.answer2.answerText,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: mainColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
              Checkbox(
                value: question.answer2.answer,
                onChanged: null,
                activeColor: Colors.green,
              )
            ],
          ),
          Row(
            children: [
              Text(' - ' + question.answer3.answerText,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: mainColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
              Checkbox(
                value: question.answer3.answer,
                onChanged: null,
                activeColor: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget AnswerWidget(String text, TextEditingController question, bool value1,
      Function(bool?)? onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(25), // smaller font size
              color: mainColor,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(746),
            child: Row(
              children: [
                ItemField(h: 100, controller: question, ontap: () {}),
                Spacer(),
                Checkbox(
                  value: value1,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void AddToQuestions(Question question) {
  questions.add(question);
}

void RemoveFromQuestions(Question question) {
  questions.remove(question);
}
