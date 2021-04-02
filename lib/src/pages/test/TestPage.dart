import 'package:clti/src/extras/Repository.dart';
import 'package:clti/src/models/Question.dart';
import 'package:clti/src/models/Test.dart';
import 'package:clti/src/pages/test/QuestionPage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    List<Test> tests = Repository.get();

    List<Question> questions = [
      ...tests.first.getQuestions(),
      ...tests.last.getQuestions(),
    ];

    var media = MediaQuery.of(context).size;
    var height = media.height * 0.65;
    var size = height / 35;

    return Scaffold(
      appBar: AppBar(
        title: Text('CLTI'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        label: new Text(tr('configs.calculate')),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            ),
            /*IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )*/
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SmoothPageIndicator(
                controller: controller,
                count: questions.length,
                effect: ExpandingDotsEffect(
                  expansionFactor: 4,
                ),
              ),
            ),
            SizedBox(height: size),
            SizedBox(
              height: height,
              child: PageView(
                controller: controller,
                children: List.generate(
                    questions.length,
                    (index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          child: Container(
                            height: height / 2.14,
                            child: QuestionPage(
                              question: questions[index],
                            ),
                          ),
                        )),
              ),
            ),
            SizedBox(height: size),
          ],
        ),
      ),
    );
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


int getFinalResult(int wifi, int glass){
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