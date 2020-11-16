import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/LogoutButton.dart';
import 'package:confnect/view/pages/ProfilePage.dart';
import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/Forums.dart';
import 'package:flutter/material.dart';
import '../Page.dart';
import '../../controller/Controller.dart';

class UserSection extends StatefulPage {
  UserSection(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _UserSectionState createState() => _UserSectionState(getController());
}

class _UserSectionState extends State<UserSection> {
  int _selectedIndex = 0;
  final Controller _controller;
  _UserSectionState(this._controller);

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

  void _onItemTapped(int idx) {
    setState(() {
      this._selectedIndex = idx;
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
      appBar: _UserSectionState._pageAppBars[this._selectedIndex],
      body: _pageBodies()[this._selectedIndex],
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
