import 'package:clti/src/models/Answer.dart';
import 'package:clti/src/models/Question.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key, @required this.question}) : super(key: key);

  final Question question;

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Answer selectedAnswer;

  @override
  Widget build(BuildContext context) {
    Question question = widget.question;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 15.0),
      child: Column(
        children: [
          Text(
            question.getName(),
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          ...radios(question),
        ],
      ),
    );
  }
}

List<Widget> radios(Question question) {
  List<Answer> answers = question.getAnswers();
  List<Widget> widgets = [];
  for (Answer answer in answers) {
    widgets.add(
      RadioListTile(
        value: null,
        groupValue: question.getId(),
        title: Text(answer.getContent()),
        onChanged: (answer) {
          print(answer);
        },
        activeColor: Colors.green,
        /*secondary: answer.getPathImg() != null
            ? Image.asset("assets/images/${answer.getPathImg()}.jpg")
            : null,*/
      ),
    );
  }
  return widgets;
}
