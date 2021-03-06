import 'package:confnect/view/pages/Search.dart';
import 'package:confnect/controller/UserSectionController.dart';
import 'package:confnect/view/pages/MainPage.dart';
import 'package:confnect/view/pages/ProfilePage.dart';
import 'package:confnect/view/widgets/forum/Forums.dart';
import 'package:flutter/material.dart';

import '../Page.dart';
import '../../controller/Controller.dart';

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
      this._controller.currentForumId == -1
          ? MainPage(_controller, _viewForum, _refreshState)
          : Forums(_controller, _refreshState),
      Search(this._controller, _viewForum, _refreshState),
      ProfilePage(this._controller, _viewForum),
      Forums(this._controller, _refreshState),
    ];
  }

  void _refreshState([int selectedIndex]) {
    setState(() {
      if (selectedIndex != null) this.selectedIndex = selectedIndex;
    });
  }

  void _viewForum(int forumId) {
    this.setState(() {
      this._controller.setCurrentForumId(forumId);
      selectedIndex = 3;
    });
  }

  Widget _addButton() {
    if ((this.selectedIndex == 0 || this.selectedIndex == 3) &&
        this._controller.getCurrentForumId() != -1) {
      if (this._controller.isAddingPost()) {
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              this._controller.changeAddingPost();
            });
          },
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          hoverColor: Color.fromARGB(200, 100, 100, 100), //Todo: Fix this color
          child: Icon(
            Icons.arrow_downward_outlined,
            size: 30,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else {
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              this._controller.changeAddingPost();
            });
          },
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          hoverColor: Color.fromARGB(200, 100, 100, 100), //Todo: Fix this color
          child: Icon(
            Icons.add_comment_outlined,
            size: 30,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      }
    }
    return null;
  }

  static List<Widget> _pageAppBars = [];

  void _onItemTapped(int idx) {
    setState(() {
      this.selectedIndex = idx;
      this._controller.setCurrentForumId(-1);
      if (this._controller.isAddingPost()) {
        this._controller.changeAddingPost();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _pageAppBars =
        UserSectionController.initAppBars(_controller, _refreshState);
    return Scaffold(
      appBar: _UserSectionState._pageAppBars[this.selectedIndex],
      body: _pageBodies()[this.selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _addButton(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
            icon: Icon(Icons.forum),
            label: 'Forums',
          ),
        ],
        currentIndex: this.selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: this._onItemTapped,
      ),
    );
  }
}
