import 'package:confnect/controller/Controller.dart';
import 'package:confnect/view/pages/admin/AddTalk.dart';
import 'package:confnect/view/pages/admin/AdminCodes.dart';
import 'package:confnect/view/pages/admin/CreateCodes.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/ExitConferenceButton.dart';
import 'package:flutter/material.dart';
import '../../Page.dart';
import '../../widgets/admin/talks/AdminTalks.dart';

class AdminSection extends StatefulPage {
  AdminSection(Controller controller, {Key key}) : super(controller, key: key);

  @override
  _AdminSectionState createState() => _AdminSectionState(getController());
}

class _AdminSectionState extends State<AdminSection> {
  int _selectedIndex = 0;
  final Controller _controller;
  _AdminSectionState(this._controller);

  List<Widget> _pageBodies() {
    return [
      AdminTalks(this._controller, _refreshState),
      AdminCodes(this._controller, _refreshState),
    ];
  }

  // Forces rerender of widget
  void _refreshState() {
    setState(() {});
  }

  List<Function> _initFABActions(BuildContext context) {
    // FAB = FloatingActionButton
    return [
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddTalk(_controller, _refreshState)),
        );
      },
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateCodes(_controller, _refreshState)),
        );
      },
    ];
  }

  void _onItemTapped(int idx) {
    setState(() {
      this._selectedIndex = idx;
    });
  }

  List<Widget> _initAppBars(List<Widget> action) {
    return [
      AppBar(
        title: Text(
          "Talks",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
      AppBar(
        title: Text(
          "Access Codes",
          style: pageTitleTextStyle,
        ),
        actions: action,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _floatingActionButtonActions = _initFABActions(context);
    var _pageAppBars =
        _initAppBars(<Widget>[ExitConferenceButton(_controller)]);
    return Scaffold(
      appBar: _pageAppBars[this._selectedIndex],
      body: _pageBodies()[this._selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _floatingActionButtonActions[this._selectedIndex],
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[800],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Talks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Access Codes',
          ),
        ],
        currentIndex: this._selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: this._onItemTapped,
      ),
    );
  }
}
