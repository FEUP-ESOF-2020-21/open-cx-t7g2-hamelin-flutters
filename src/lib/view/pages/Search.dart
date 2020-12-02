import 'package:confnect/controller/Controller.dart';
import 'package:flutter/material.dart';

import '../Page.dart';

class Search extends StatefulPage {
  Search(Controller controller, {Key key}) : super(controller, key: key);

  _SearchState createState() => _SearchState(super.getController());
}

class _SearchState extends State<Search> {
  final Controller _controller;
  String _searchTerm = "";
  _SearchState(this._controller);

  void _onSearchTermChange(String value) {
    setState(() {
      _searchTerm = value;
    });
  }

  List<Widget> getResults() {
    SearchResult result = _controller.search(_searchTerm);
    return [
      Text("hey"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: _onSearchTermChange,
          autofocus: true,
        ),
      ),
      body: Column(
        children: getResults(),
      ),
    );
  }
}
