import 'package:clti/src/models/Answer.dart';
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

    // Questions

    List<Question> wifiQuestions = [
      new Question('w', tr('data.test.wifi.questions.w.name'), wAnswers),
      new Question('i', tr('data.test.wifi.questions.i.name'), iAnswers),
      new Question('fi', tr('data.test.wifi.questions.fi.name'), fiAnswers),
    ];

    List<Question> glassQuestions = [
      new Question('fp', tr('data.test.glass.questions.fp.name'), fpAnswers),
      new Question('ip', tr('data.test.glass.questions.ip.name'), ipAnswers),
    ];

    // Tests

    List<Test> tests = [
      new Test('wifi', tr('data.test.glass.questions.ip.name'), wifiQuestions),
      new Test(
          'glass', tr('data.test.glass.questions.ip.name'), glassQuestions),
    ];

    return tests;
  }
}
