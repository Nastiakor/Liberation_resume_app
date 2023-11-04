import 'package:cv_flutter_libe/ressources/icons/icons.dart';
import 'package:cv_flutter_libe/utils/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/main.dart';
import 'package:cv_flutter_libe/services/libe_api.dart';
import 'package:cv_flutter_libe/services/chez_pol.dart';
import 'package:cv_flutter_libe/views/pages/sncf_api.dart';
import 'package:cv_flutter_libe/views/pages/useradgents_feed.dart';

// ignore: must_be_immutable
class MyBottomHomeNavigationBar extends StatefulWidget {
  int currentIndex;

  MyBottomHomeNavigationBar({Key? key, required this.currentIndex})
      : super(key: key) {
    print('Current index is: $currentIndex');
    assert(currentIndex >= 0 && currentIndex < 4, 'currentIndex must be between 0 and 3, inclusive.');
  }


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
        ),   BottomNavigationBarItem(
          icon: Icon(Icons.train, size: 24),
          label: 'SNCF',
        ),
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.passage_du_temps, size: 24),
          label: 'Fil info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 29),
          label: 'Login',
        ),
      ],
      selectedItemColor: Colors.black,
      onTap: (index) {
        widget.currentIndex = index;
        switch (widget.currentIndex) {
          case 0:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
            break;
          case 1:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SncfAPI()));
            break;
          case 2:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LiberationAPI()));
            break;
          case 3:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const WidgetTree()));
            break;
        }
      },

    );
  }
}