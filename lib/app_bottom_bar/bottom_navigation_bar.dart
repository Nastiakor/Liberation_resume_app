import 'package:cv_flutter_libe/icons.dart';
import 'package:cv_flutter_libe/views/news_feed_nyt.dart';
import 'package:cv_flutter_libe/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/main.dart';
import 'package:cv_flutter_libe/views/libe_api.dart';
import 'package:cv_flutter_libe/views/chez_pol.dart';

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
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black38,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account_rounded, size: 24),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.passage_du_temps, size: 24),
          label: 'Fil info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city_sharp, size: 29),
          label: 'Best of the NYT',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance, size: 29),
          label: 'Chez Pol',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 29),
          label: 'Login',
        ),
      ],
      selectedItemColor: Colors.black,
      onTap: (index) {
        setState(() {
          widget.currentIndex = index;
          if (widget.currentIndex == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LiberationAPI()));
          } else if (widget.currentIndex == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          } else if (widget.currentIndex == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NYTAPI()));
          }else if (widget.currentIndex == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChezPol()));
          }else if (widget.currentIndex == 4) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WidgetTree()));
          }
        });
      },
    );
  }
}