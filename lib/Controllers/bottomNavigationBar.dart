import 'package:cv_flutter_libe/icons.dart';
import 'package:cv_flutter_libe/views/newsFeedNYT.dart';
import 'package:cv_flutter_libe/views/sncfConnectAPI.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/main.dart';
import 'package:cv_flutter_libe/views/libeAPI.dart';
import 'package:cv_flutter_libe/views/chezpol.dart';
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
  int currentIndex;

  MyBottomHomeNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<MyBottomHomeNavigationBar> createState() =>
      MyBottomHomeNavigationBarState();
}

class MyBottomHomeNavigationBarState extends State<MyBottomHomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.libelogo, size: 12),
          label: '     A la une',
        ),
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.passage_du_temps, size: 24),
          label: 'Fil info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ads_click, size: 28),
          label: 'Best of the NYT',
        ),
      ],
      selectedItemColor: Colors.red,
      onTap: (index) {
        setState(() {
          widget.currentIndex = index;
          if (widget.currentIndex == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LiberationAPI()));
          } else if (widget.currentIndex == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          } else if (widget.currentIndex == 2) {
                showModal(context);
          }
        });
      },
    );
  }
}
