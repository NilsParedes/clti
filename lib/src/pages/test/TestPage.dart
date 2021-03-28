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
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
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
