import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/SearchResult.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/posts/HorizontalUserList.dart';
import 'package:confnect/view/widgets/posts/posttile/PostTile.dart';
import 'package:confnect/view/widgets/forum/HorizontalForumList.dart';
import 'package:flutter/material.dart';
import '../Page.dart';

class Search extends StatefulPage {
  final Function _viewForum;
  // ignore: unused_field
  final Function _refresh;
  Search(Controller controller, this._viewForum, this._refresh, {Key key})
      : super(controller, key: key);

  _SearchState createState() => _SearchState(
        super.getController(),
        this._viewForum,
      );
}

class _SearchState extends State<Search> {
  final Controller _controller;
  final Function _viewForum;
  String _searchTerm = "";
  _SearchState(this._controller, this._viewForum);

  void _onSearchTermChange(String value) {
    setState(() {
      _searchTerm = value;
    });
  }

  Widget getPosts(SearchResult result) {
    return Container(
      child: Column(
        children: result
            .getPosts()
            .sublist(0, 5)
            .map((post) => PostTile(post, _controller, () {
                  setState(() {});
                }, showForum: false))
            .toList(),
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
    );
  }

  List<Widget> getResults() {
    SearchResult result =
        _controller.search(_controller.getConference(), _searchTerm);
    int forumLength =
        result.getForums().length > 4 ? 4 : result.getForums().length;
    int userLength =
        result.getUsers().length > 4 ? 4 : result.getUsers().length;
    return [
      Container(
        child: Text(
          "Forums",
          style: pageTitleTextStyle,
          textScaleFactor: 0.8,
        ),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      ),
      HorizontalForumList(
          _controller, _viewForum, result.getForums().sublist(0, forumLength)),
      Container(
        child: Text(
          "Users",
          style: pageTitleTextStyle,
          textScaleFactor: 0.8,
        ),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      ),
      HorizontalUserList(
          _controller, _viewForum, result.getUsers().sublist(0, userLength)),
      Container(
        child: Text(
          "Posts",
          style: pageTitleTextStyle,
          textScaleFactor: 0.8,
        ),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
      ),
      getPosts(result),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
          onChanged: _onSearchTermChange,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getResults(),
        ),
      ),
    );
  }
}
