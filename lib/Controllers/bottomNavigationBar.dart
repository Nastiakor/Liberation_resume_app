import 'package:cv_flutter_libe/icons.dart';
import 'package:cv_flutter_libe/views/newsFeed.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/main.dart';
import 'package:cv_flutter_libe/views/homePage.dart';

void showModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text('Example Dialog'),
      actions: <TextButton>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        )
      ],
    ),
  );
}

class MyBottomHomeNavigationBar extends StatefulWidget {
  MyBottomHomeNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomHomeNavigationBar> createState() =>
      _MyBottomHomeNavigationBarState();
}

//final int selectedIndex;
// final void Function(int) onItemTapped;
class _MyBottomHomeNavigationBarState extends State<MyBottomHomeNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.libelogo, size: 19),
          label: '        A la une',
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
      selectedItemColor: Colors.red,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          if (_currentIndex == 2) {
            showModal(context);
          } else if (_currentIndex == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          } else if (_currentIndex == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const newsFeed()));
            // your code for the second tab
          }
        });
      },
    );
  }
}
