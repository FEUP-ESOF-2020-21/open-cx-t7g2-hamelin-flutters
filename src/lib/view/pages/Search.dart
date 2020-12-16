import 'package:confnect/controller/Controller.dart';
import 'package:confnect/model/SearchResult.dart';
import 'package:confnect/view/pages/ProfilePage.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/Posts/HorizontalUserList.dart';
import 'package:confnect/view/widgets/Posts/PostTile/PostTile.dart';
import 'package:confnect/view/widgets/User/UserTile.dart';
import 'package:confnect/view/widgets/forum/ForumTile.dart';
import 'package:confnect/view/widgets/forum/HorizontalForumList.dart';
import 'package:flutter/material.dart';
import '../Page.dart';

class Search extends StatefulPage {
  final Function _viewForum;
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
                }, showForum: true))
            .toList(),
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
    );
  }

  List<Widget> getResults() {
    SearchResult result =
        _controller.search(_controller.getConference(), _searchTerm);
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
          _controller, _viewForum, result.getForums().sublist(0, 4)),
      Container(
        child: Text(
          "Users",
          style: pageTitleTextStyle,
          textScaleFactor: 0.8,
        ),
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      ),
      HorizontalUserList(
          _controller, widget._refresh, result.getUsers().sublist(0, 4)),
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

  //TODO APAGAR FUNÇOES ANTIGAS

  Widget getForums(SearchResult result) {
    return Container(
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
            .map((forum) => ForumTile(forum, _viewForum,
                showTags: false, showDescription: false))
            .toList(),
      ),
    );
  }

  Widget getUsers(SearchResult result) {
    return Container(
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
            .map((user) => UserTile(user, (userToSee) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                            _controller, _viewForum,
                            user: userToSee)),
                  );
                })) /* TO FINISH WITH THE NEW POST PAGE */
            .toList(),
      ),
    );
  }
}
