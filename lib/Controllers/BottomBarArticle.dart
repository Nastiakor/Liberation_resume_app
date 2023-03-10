import 'package:flutter/material.dart';

class BottomBarObject extends StatefulWidget {
  BottomBarObject({Key? key}) : super(key: key);

  @override
  State<BottomBarObject> createState() => _BottomBarObjectState();
}

class _BottomBarObjectState extends State<BottomBarObject> {
  int _currentIndex = 0;
  double _fontSize = 16.0;
  double _selectedFontSize = 16.0;

  void _updateFontSize(double newSize) {
    setState(() {
      _fontSize = newSize;
    });
  }

  void _handleFontSizeTap() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sélectionner la taille de la police'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                RadioListTile(
                  title: Text('Petit'),
                  value: 12.0,
                  groupValue: _selectedFontSize,
                  onChanged: (value) {
                    _updateFontSize(value!);
                    _selectedFontSize = value;
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text('Moyen'),
                  value: 16.0,
                  groupValue: _selectedFontSize,
                  onChanged: (value) {
                    _updateFontSize(value!);
                    _selectedFontSize = value;
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text('Grand'),
                  value: 20.0,
                  groupValue: _selectedFontSize,
                  onChanged: (value) {
                    _updateFontSize(value!);
                    _selectedFontSize = value;
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }


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
          icon: Icon(Icons.text_fields),
          label: 'Font Size',
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
          } else if (_currentIndex == 1) {
            _handleFontSizeTap();
          }
        });
      },
    );
  }
}
