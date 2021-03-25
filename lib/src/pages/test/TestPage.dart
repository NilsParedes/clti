import 'package:clti/src/pages/test/QuestionPage.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('CLTI'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        label: const Text('CALCULAR'),
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
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 4,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 600,
                child: PageView(
                  controller: controller,
                  children: List.generate(
                      5,
                      (_) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            child: Container(height: 280, child: QuestionPage(),),
                          )),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
