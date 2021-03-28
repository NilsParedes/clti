class Answer {
  Answer(this._id, this._content, this._pathImg);

  int _id;
  String _content;
  String _pathImg;

  int getId() {
    return this._id;
  }

  String getContent() {
    return this._content;
  }

  String getPathImg() {
    return this._pathImg;
  }
}
