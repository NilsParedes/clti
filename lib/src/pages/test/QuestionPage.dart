import 'package:clti/src/models/Answer.dart';
import 'package:clti/src/models/Legend.dart';
import 'package:clti/src/models/Question.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key, @required this.question}) : super(key: key);

  final Question question;

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Answer _selectedAnswer = Answer(null, null, null);

  @override
  Widget build(BuildContext context) {
    Question question = widget.question;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 15.0),
      child: ListView(
        children: [
          Text(
            question.getName(),
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          ...radios(question),
          SizedBox(height: 26),
          ...question.getLegends().map((Legend legend) {
            return Center(
                child: Text.rich(TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: legend.getTitle(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: " : ${legend.getContent()}")
              ],
            )));
          }),
        ],
      ),
    );
  }

  List<Widget> radios(Question question) {
    List<Answer> answers = question.getAnswers();
    List<Widget> widgets = [];
    for (Answer answer in answers) {
      widgets.add(
        RadioListTile<Answer>(
          value: answer,
          groupValue: _selectedAnswer,
          title: Text(answer.getContent()),
          onChanged: (answer) {
            setState(() {
              _selectedAnswer = answer;
            });
          },
          activeColor: Colors.green,
        ),
      );

      if (answer.getPathImg() != null) {
        widgets.add(Image.asset("assets/images/${answer.getPathImg()}.jpg"));
      }
    }
    return widgets;
  }
}
