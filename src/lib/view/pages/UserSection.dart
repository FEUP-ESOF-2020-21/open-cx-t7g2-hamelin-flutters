import 'package:confnect/view/widgets/LogoutButton.dart';
import 'package:confnect/view/pages/ProfilePage.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/ForumList.dart';
import 'package:flutter/material.dart';

import '../Page.dart';
import '../../controller/Controller.dart';
import '../widgets/CreatePost.dart';

class UserSection extends StatefulPage {
  UserSection(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _UserSectionState createState() => _UserSectionState(getController());
}

class _UserSectionState extends State<UserSection> {
  int _selectedIndex = 0;
  bool _addingPost = false;
  final Controller _controller;
  _UserSectionState(this._controller, [this._addingPost = false]);

  static final List<Widget> _pageBodies = [
    ForumList(),
    Text("Coming soon..."),
    ProfilePage(),
    PostList(),
  ];
  static List<Widget> _pageAppBars = [];

  Widget _addButton() {
    if (this._selectedIndex == 3 && !_addingPost) {
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            //this._selectedIndex = this._selectedIndex;
            this._addingPost = true;
          });
        },
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        hoverColor: Color.fromARGB(200, 100, 100, 100), //Todo: Fix this color
        child: Icon(
          Icons.add_comment_outlined,
          size: 30,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      );
    } else if (this._selectedIndex == 3 && _addingPost) {
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            this._addingPost = false;
          });
        },
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        hoverColor: Color.fromARGB(200, 100, 100, 100), //Todo: Fix this color
        child: Icon(
          Icons.arrow_downward_outlined,
          size: 30,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      );
    } else {
      return null;
    }
  }

  Widget _getBody() {
    print(this._addingPost);
    if (this._addingPost) {
      return Column(
        children: <Widget>[
          Container(
            height: 300,
            child: _UserSectionState._pageBodies[this._selectedIndex],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 3,
            color: Colors.black,
          ),
          CreatePostInput(),
        ],
      );
    }
    return _UserSectionState._pageBodies[this._selectedIndex];
  }

  void _onItemTapped(int idx) {
    setState(() {
      this._selectedIndex = idx;
      this._addingPost = false;
    });
  }

  List<Widget> _initAppBars(List<Widget> action) {
    return [
      AppBar(
        title: Text("Forums"),
        actions: action,
      ),
      AppBar(
        title: Text("Search"),
        actions: action,
      ),
      AppBar(
        title: Text("Profile"),
        actions: action,
      ),
      AppBar(
        title: Text("Data Science"),
        actions: action,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _pageAppBars = _initAppBars(<Widget>[LogoutButton(_controller)]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _UserSectionState._pageAppBars[this._selectedIndex],
      body: this._getBody(),
      floatingActionButton: _addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Discussions',
          ),
        ],
        currentIndex: this._selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: this._onItemTapped,
      ),
    );
  }
}
