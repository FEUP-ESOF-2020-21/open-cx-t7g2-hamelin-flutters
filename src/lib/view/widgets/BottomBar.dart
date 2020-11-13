import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class DefaultBottomBar {
  static List<BottomNavigationBarItem> getItems() {
    return [
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
      )
    ];
  }
}

class AddButtonBottomBar {
  static List<BottomNavigationBarItem> getItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.forum),
        label: 'Forums',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'Discussions',
      ),
    ];
  }
}
