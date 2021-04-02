import 'package:clti/src/models/Answer.dart';
import 'package:clti/src/models/Legend.dart';

class Question {
  Question(this._id, this._name, this._answers, this._legends);

  int _id;
  String _name;
  List<Answer> _answers;
  List<Legend> _legends;

  int getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  List<Answer> getAnswers() {
    return this._answers;
  }

  List<Legend> getLegends() {
    return this._legends;
  }
}
