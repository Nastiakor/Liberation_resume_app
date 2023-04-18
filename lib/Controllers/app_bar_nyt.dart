import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

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

class NYTAppBar extends AppBar {
  NYTAppBar({Key? key})
      : super(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Animate(
                  onPlay: (controller) => controller.repeat(), // the loop
                  child: const Icon(Icons.brightness_1, color: Colors.red, size: 15).animate()
              ).fadeIn(delay: 1500.ms),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  'Best of The New York Times',
                  style: GoogleFonts.encodeSansCondensed(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                        fontSize: 20,
                        letterSpacing: 0.2),
                  ),
                ),
              ),
            ],
          ),
        );
}
