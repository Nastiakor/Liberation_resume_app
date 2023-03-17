import 'package:cv_flutter_libe/icons.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  MyBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.libelogo, size: 19),
          label: '          A la une',
        ),
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.passage_du_temps, size: 25),
          label: 'Fil info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red,
      onTap: onItemTapped,
    );
  }
}
