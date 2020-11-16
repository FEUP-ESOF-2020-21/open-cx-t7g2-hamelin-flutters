class Forum {
  final String _title, _description, _imageURL;
  final int _id;
  Forum(this._id, this._title, this._description, this._imageURL);

  int getId() => _id;

  String getTitle() => _title;

  String getImageURL() => _imageURL;

  String getDescription() => _description;
}
