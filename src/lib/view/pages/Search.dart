import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/SearchResult.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:confnect/view/widgets/User/UserTile.dart';
import 'package:confnect/view/widgets/forum/ForumTile.dart';
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
      Container(
        child: Text(
          "Forums",
          style: pageTitleTextStyle,
          textScaleFactor: 0.8,
        ),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      ),
      Container(
        child: GridView.count(
          primary: true,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          physics:
              NeverScrollableScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true, // You won't see infinite size error
          children: result
              .getForums()
              .sublist(0, 4)
              .map((forum) => ForumTile(forum, () {},
                  showTags: false, showDescription: false))
              .toList(),
        ),
      ),
      Container(
        child: Text(
          "Users",
          style: pageTitleTextStyle,
          textScaleFactor: 0.8,
        ),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      ),
      Container(
        child: GridView.count(
          primary: true,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          physics:
              NeverScrollableScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true, // You won't see infinite size error
          children: result
              .getUsers()
              .sublist(0, 4)
              .map((user) =>
                  UserTile(user, () {})) /* TO FINISH WITH THE NEW POST PAGE */
              .toList(),
        ),
      ),
      Container(
        child: Text(
          "Posts",
          style: pageTitleTextStyle,
          textScaleFactor: 0.8,
        ),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
      ),
      Container(
        child: Column(
          children: result
              .getPosts()
              .sublist(0, 5)
              .map((post) => PostTile(post, _controller))
              .toList(),
        ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      ),
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
      body: ListView(
        children: getResults(),
      ),
    );
  }
}
