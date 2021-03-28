import 'package:clti/src/models/Answer.dart';

class Question {
  Question(this._id, this._name, this._answers);

  String _id;
  String _name;
  List<Answer> _answers;

  String getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  List<Answer> getAnswers() {
    return this._answers;
  }
}
