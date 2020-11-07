import 'package:confnect/view/widgets/Posts/PostList.dart';
import 'package:confnect/view/widgets/forum/ForumList.dart';
import 'package:flutter/material.dart';
import '../Page.dart';
import '../../controller/Controller.dart';

class UserSection extends StatefulPage {
  UserSection(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _UserSectionState createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {
  int _selectedIndex = 0;

  static final List<Widget> _options = [
    ForumList(),
    Text("Search..."),
    Text("Profile..."),
    PostList(),
  ];

  void _onItemTapped(int idx) {
    setState(() {
      this._selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _UserSectionState._options[this._selectedIndex],
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
