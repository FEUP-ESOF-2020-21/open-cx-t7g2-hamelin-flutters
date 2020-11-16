class Talk {
  final String _title, _description, _imageURL;
  final int _speakerId;
  final List<int> _tags;

  Talk(this._title, this._description, this._speakerId, this._imageURL,
      this._tags);

  String getTitle() => _title;
  String getDescription() => _description;
  String getImageURL() => _imageURL;
  int getSpeakerId() => _speakerId;
  List<int> getTags() => _tags;
}
