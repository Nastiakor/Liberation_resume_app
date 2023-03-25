import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const titleColor = Color(0XFFE60004);

class MyAppBar extends AppBar {
  MyAppBar({Key? key})
      : super(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'img/1200px-Libération.svg.png',
                  width: 100,
                ),
              ),
            ],
          ),
        );
}

class MyAppBarFeed extends AppBar {
  MyAppBarFeed({Key? key})
      : super(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  'Fil info',
                  style: GoogleFonts.encodeSansCondensed(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                        fontSize: 35,
                        letterSpacing: 0.2),
                  ),
                ),
              ),
            ],
          ),
        );
}
