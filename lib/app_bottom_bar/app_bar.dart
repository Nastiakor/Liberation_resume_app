import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

const titleColor = Color(0XFFE60004);

class AppBarMain extends AppBar {
  AppBarMain({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'img/j&a.png',
              width: 50,
            ),
        ],
      ),
    );
  }
}

class AppBarFeed extends AppBar {
  AppBarFeed({Key? key})
      : super(
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
                  'Fil info',
                  style: GoogleFonts.encodeSansCondensed(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                        fontSize: 25,
                        letterSpacing: 0.2),
                  ),
                ),
              ),
            ],
          ),
        );
}