class Forum {
  final String _title, _description, _imageURL;
  Forum(this._title, this._description, this._imageURL);

  String getTitle() {
    return _title;
  }

  String getImageURL() {
    return _imageURL;
  }

  String getDescription() {
    return _description;
  }
}
