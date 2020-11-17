import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/LogoutButton.dart';
import 'package:confnect/view/pages/ProfilePage.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/Forums.dart';
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

  List<Widget> _pageBodies() {
    return [
      Forums(this._controller),
      Text("Coming soon..."),
      ProfilePage(),
      PostList(this._controller, 0, () {
        print("mock function :(");
      }),
    ];
  }

  static List<Widget> _pageAppBars = [];

  Widget _addButton() {
    if (this.selectedIndex == 0 && !this._controller.isAddingPost()) {
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
    } else if (this.selectedIndex == 0 && this._controller.isAddingPost()) {
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
        title: Text(
          "Forums",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
      AppBar(
        title: Text(
          "Search",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
      AppBar(
        title: Text(
          "Profile",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
      AppBar(
        title: Text(
          "Data Science",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _pageAppBars = _initAppBars(<Widget>[LogoutButton(_controller)]);
    return Scaffold(
      appBar: _UserSectionState._pageAppBars[this.selectedIndex],
      body: _pageBodies()[this.selectedIndex],
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
