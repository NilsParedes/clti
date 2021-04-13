import 'package:clti/src/models/Answer.dart';
import 'package:clti/src/models/Legend.dart';
import 'package:clti/src/models/Question.dart';
import 'package:clti/src/models/Test.dart';
import 'package:easy_localization/easy_localization.dart';

class Repository {
  static List<Test> get() {
    // WIFI Answers

    List<Answer> wAnswers = [
      new Answer(0, tr('data.test.wifi.questions.w.answers.0'), null),
      new Answer(1, tr('data.test.wifi.questions.w.answers.1'), null),
      new Answer(2, tr('data.test.wifi.questions.w.answers.2'), null),
      new Answer(3, tr('data.test.wifi.questions.w.answers.3'), null),
    ];

    List<Answer> iAnswers = [
      new Answer(0, tr('data.test.wifi.questions.i.answers.0'), null),
      new Answer(1, tr('data.test.wifi.questions.i.answers.1'), null),
      new Answer(2, tr('data.test.wifi.questions.i.answers.2'), null),
      new Answer(3, tr('data.test.wifi.questions.i.answers.3'), null),
    ];

    List<Answer> fiAnswers = [
      new Answer(0, tr('data.test.wifi.questions.fi.answers.0'), null),
      new Answer(1, tr('data.test.wifi.questions.fi.answers.1'), null),
      new Answer(2, tr('data.test.wifi.questions.fi.answers.2'), null),
      new Answer(3, tr('data.test.wifi.questions.fi.answers.3'), null),
    ];

    // Glass Answers

    List<Answer> fpAnswers = [
      new Answer(0, tr('data.test.glass.questions.fp.answers.0'), null),
      new Answer(1, tr('data.test.glass.questions.fp.answers.1'), '1'),
      new Answer(2, tr('data.test.glass.questions.fp.answers.2'), '2'),
      new Answer(3, tr('data.test.glass.questions.fp.answers.3'), '3'),
      new Answer(4, tr('data.test.glass.questions.fp.answers.4'), '4'),
    ];

    List<Answer> ipAnswers = [
      new Answer(0, tr('data.test.glass.questions.ip.answers.0'), null),
      new Answer(1, tr('data.test.glass.questions.ip.answers.1'), '5'),
      new Answer(2, tr('data.test.glass.questions.ip.answers.2'), '6'),
      new Answer(3, tr('data.test.glass.questions.ip.answers.3'), '7'),
      new Answer(4, tr('data.test.glass.questions.ip.answers.4'), '8'),
    ];

    // Legends

    List<Legend> iLegends = [
      new Legend(tr('data.test.wifi.questions.i.legends.0.name'),
          tr('data.test.wifi.questions.i.legends.0.content')),
      new Legend(tr('data.test.wifi.questions.i.legends.1.name'),
          tr('data.test.wifi.questions.i.legends.1.content')),
      new Legend(tr('data.test.wifi.questions.i.legends.2.name'),
          tr('data.test.wifi.questions.i.legends.2.content')),
      new Legend(tr('data.test.wifi.questions.i.legends.3.name'),
          tr('data.test.wifi.questions.i.legends.3.content')),
    ];

    List<Legend> fiLegends = [
      new Legend(tr('data.test.wifi.questions.fi.legends.0.name'),
          tr('data.test.wifi.questions.fi.legends.0.content')),
    ];

    List<Legend> fpLegends = [
      new Legend(tr('data.test.glass.questions.fp.legends.0.name'),
          tr('data.test.glass.questions.fp.legends.0.content')),
      new Legend(tr('data.test.glass.questions.fp.legends.1.name'),
          tr('data.test.glass.questions.fp.legends.1.content')),
    ];

    // Questions

    List<Question> wifiQuestions = [
      new Question(0, tr('data.test.wifi.questions.w.name'), wAnswers, []),
      new Question(
          1, tr('data.test.wifi.questions.i.name'), iAnswers, iLegends),
      new Question(
          2, tr('data.test.wifi.questions.fi.name'), fiAnswers, fiLegends),
    ];

    List<Question> glassQuestions = [
      new Question(
          3, tr('data.test.glass.questions.fp.name'), fpAnswers, fpLegends),
      new Question(4, tr('data.test.glass.questions.ip.name'), ipAnswers, []),
    ];

    // Tests

    List<Test> tests = [
      new Test('wifi', tr('data.test.wifi.name'), wifiQuestions),
      new Test('glass', tr('data.test.glass.name'), glassQuestions),
    ];

    return tests;
  }
}
