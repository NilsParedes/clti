import 'package:clti/src/extras/Repository.dart';
import 'package:clti/src/models/Answer.dart';
import 'package:clti/src/models/Legend.dart';
import 'package:clti/src/models/Question.dart';
import 'package:clti/src/models/Test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<int> _selectedAnswer = [
    null,
    null,
    null,
    null,
    null,
  ];

  @override
  Widget build(BuildContext context) {
    List<Test> tests = Repository.get();

    List<Question> questions = [
      ...tests.first.getQuestions(),
      ...tests.last.getQuestions(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('CLTI'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          label: new Text(tr('configs.calculate')),
          onPressed: () {
            int wifiResult = getWifiResult(
                _selectedAnswer[0], _selectedAnswer[1], _selectedAnswer[2]);
            int glassResult =
                getGlassResult(_selectedAnswer[3], _selectedAnswer[4]);

            int result = getFinalResult(wifiResult, glassResult);

            bool passed = _selectedAnswer.every((element) => element != null);

            if (passed) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Container(
                          width: double.maxFinite,
                          child: ListView(
                            children: [
                              Text.rich(
                                TextSpan(
                                    text: 'WIFI' +
                                        ' ' +
                                        tr('configs.stage') +
                                        ' ' +
                                        wifiResult.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                tr("data.test.wifi.results.$wifiResult"),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Text.rich(
                                TextSpan(
                                    text: 'GLASS' +
                                        ' ' +
                                        tr('configs.stage') +
                                        ' ' +
                                        glassResult.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                tr("data.test.glass.results.$glassResult"),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 60),
                              Text.rich(
                                TextSpan(
                                    text: tr("data.results.$result"),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 0.0),
                              child: RaisedButton(
                                color: Colors.indigo,
                                child: Icon(Icons.sync),
                                onPressed: () {
                                  setState(() {
                                    _selectedAnswer = [
                                      null,
                                      null,
                                      null,
                                      null,
                                      null,
                                    ];
                                  });
                                  Navigator.pop(context);
                                },
                              ))
                        ],
                        elevation: 24.0,
                      ));
            } else {
              Fluttertoast.showToast(
                  msg: tr('configs.toast_error'),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER_RIGHT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 15.0);
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(tr('configs.about')),
                          actions: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0),
                                child: RaisedButton(
                                  color: Colors.indigo,
                                  child: Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ))
                          ],
                          content: Container(
                            width: double.maxFinite,
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                for (var about in [0, 1, 2, 3, 4, 5, 6])
                                  Column(
                                    children: <Widget>[
                                      Text(tr("data.about.$about"),
                                          textAlign: TextAlign.center),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          elevation: 24.0,
                        ));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Card(
          child: ListView(children: <Container>[
        ...questions.map((Question question) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 15.0),
              child: Column(
                children: [
                  Text(
                    question.getName(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  ...radios(question),
                  SizedBox(height: 26),
                  ...question.getLegends().map((Legend legend) {
                    return Align(
                        alignment: Alignment.centerLeft,
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
              ));
        })
      ])),
    );
  }

  List<Widget> radios(Question question) {
    List<Answer> answers = question.getAnswers();
    List<Widget> widgets = [];
    for (Answer answer in answers) {
      widgets.add(
        RadioListTile<int>(
          value: answer.getId(),
          groupValue: _selectedAnswer[question.getId()],
          title: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
                text: answer.getId().toString() + '. ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: answer.getContent()),
          ])),
          onChanged: (value) {
            setState(() {
              _selectedAnswer[question.getId()] = value;
            });
          },
          activeColor: Colors.red,
        ),
      );

      if (answer.getPathImg() != null) {
        widgets.add(Image.asset("assets/images/${answer.getPathImg()}.jpg"));
      }
    }
    return widgets;
  }
}

int getWifiResult(int w, int i, int fi) {
  Map<String, int> results = {
    '000': 1,
    "001": 1,
    "010": 1,
    "100": 1,
    "101": 1,
    "110": 1,
    '002': 2,
    '011': 2,
    '020': 2,
    '021': 2, // Repeat
    '030': 2,
    '102': 2,
    '111': 2,
    '120': 2,
    '200': 2,
    '201': 2,
    '003': 3,
    //'021': 3, Repeat
    '022': 3,
    '031': 3,
    '032': 3,
    '103': 3,
    '112': 3,
    '121': 3,
    '130': 3,
    '131': 3,
    '202': 3,
    '210': 3,
    '211': 3,
    '220': 3,
    '300': 3,
    '301': 3,
    '013': 4,
    '023': 4,
    '033': 4,
    '113': 4,
    '122': 4,
    '123': 4,
    '132': 4,
    '133': 4,
    '203': 4,
    '212': 4,
    '213': 4,
    '221': 4,
    '222': 4,
    '223': 4,
    '230': 4,
    '231': 4,
    '232': 4,
    '233': 4,
    '302': 4,
    '303': 4,
    '310': 4,
    '311': 4,
    '312': 4,
    '313': 4,
    '320': 4,
    '321': 4,
    '322': 4,
    '323': 4,
    '330': 4,
    '331': 4,
    '332': 4,
    '333': 4,
  };

  String score = w.toString() + i.toString() + fi.toString();
  return results[score];
}

int getGlassResult(int fp, int ip) {
  Map<String, int> results = {
    '00': -1,
    '01': 1,
    '02': 1,
    '03': 2,
    '04': 3,
    '10': 1,
    '11': 1,
    '12': 2,
    '13': 2,
    '14': 3,
    '20': 1,
    '21': 2,
    '22': 2,
    '23': 2,
    '24': 3,
    '30': 2,
    '31': 2,
    '32': 2,
    '33': 3,
    '34': 3,
    '40': 3,
    '41': 3,
    '42': 3,
    '43': 3,
    '44': 3,
  };

  String score = fp.toString() + ip.toString();
  return results[score];
}

int getFinalResult(int wifi, int glass) {
  Map<String, int> results = {
    '11': 1,
    '12': 1,
    '13': 1,
    '21': 2,
    '22': 2,
    '23': 4,
    '31': 2,
    '32': 4,
    '33': 3,
    '41': 2,
    '42': 4,
    '43': 3,
  };

  String score = wifi.toString() + glass.toString();
  return results[score];
}
