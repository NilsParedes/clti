import 'package:clti/src/models/Question.dart';

class Test {
  Test(this._id, this._name, this._questions);

  String _id;
  String _name;
  List<Question> _questions;

  String getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  List<Question> getQuestions() {
    return this._questions;
  }
}