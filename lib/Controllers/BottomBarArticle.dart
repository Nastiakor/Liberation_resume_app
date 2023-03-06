import 'package:flutter/material.dart';

class BottomBarObject extends StatefulWidget {
  @override
  BottomBarArticle createState() => BottomBarArticle();
}

class BottomBarArticle extends State<BottomBarObject> {
  BottomBarArticle({Key? key}) : super(key: key);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    final DateTime articlePublishingDate = DateTime(2023, 02, 27);

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.close, size: 25),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border, size: 25),
          label: '',
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;

          if (_currentIndex == 0) {
            Navigator.of(context).pop();
          }
        });
      },
    );
  }
}
