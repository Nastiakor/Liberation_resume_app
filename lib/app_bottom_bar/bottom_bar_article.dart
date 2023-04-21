import 'package:flutter/material.dart';

class BottomBarArticle extends StatefulWidget {
  const BottomBarArticle({Key? key}) : super(key: key);

  @override
  State<BottomBarArticle> createState() => _BottomBarArticleState();
}

class _BottomBarArticleState extends State<BottomBarArticle> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(Icons.contact_page, size: 25),
          label: '',
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;

          if (_currentIndex == 0) {
            Navigator.of(context).pop();
         } else if (_currentIndex == 1) {
            _showModal(context);
           // _handleFontSizeTap();
          }
        });
      },
    );
  }
}

void _showModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text('J&A @2023'),
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