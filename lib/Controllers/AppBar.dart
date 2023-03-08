import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key? key})
      : super(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 50),
          child: Image.asset(
            'img/1200px-Libération.svg.png',
            width: 100,
          ),
        ),
      ],
    ),
  );
}
