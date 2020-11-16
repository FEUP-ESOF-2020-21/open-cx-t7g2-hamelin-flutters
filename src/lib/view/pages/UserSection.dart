import 'package:confnect/view/widgets/LogoutButton.dart';
import 'package:confnect/view/pages/ProfilePage.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/ForumList.dart';
import 'package:flutter/material.dart';

import '../Page.dart';
import '../../controller/Controller.dart';
import '../widgets/Posts/CreatePost.dart';

class UserSection extends StatefulPage {
  final int index;
  UserSection(Controller controller, {this.index = 0, Key key})
      : super(controller, key: key);

  @override
  _UserSectionState createState() =>
      _UserSectionState(getController(), selectedIndex: this.index);
}

class _UserSectionState extends State<UserSection> {
  int selectedIndex = 0;
  final Controller _controller;
  _UserSectionState(this._controller, {this.selectedIndex = 0});

  static List<Widget> _pageBodies = [];
  static List<Widget> _pageAppBars = [];

  Widget _addButton() {
    if (this.selectedIndex == 3 && !this._controller.isAddingPost()) {
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            this._controller.setAddingPost(true);
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
    } else if (this.selectedIndex == 3 && this._controller.isAddingPost()) {
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            this._controller.setAddingPost(false);
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

  void _onItemTapped(int idx) {
    setState(() {
      this.selectedIndex = idx;
      this._controller.setAddingPost(false);
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

  List<Widget> _initPageBodies() {
    return [
      ForumList(),
      Text("Coming soon..."),
      ProfilePage(),
      PostList(controller: this._controller),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _pageAppBars = _initAppBars(<Widget>[LogoutButton(_controller)]);
    _pageBodies = _initPageBodies();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _UserSectionState._pageAppBars[this.selectedIndex],
      body: _UserSectionState._pageBodies[this.selectedIndex],
      floatingActionButton: _addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        currentIndex: this.selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: this._onItemTapped,
      ),
    );
  }
}
