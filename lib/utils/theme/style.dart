import 'package:cv_flutter_libe/views/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextSpan redTitle(String title) {
  const titleColor = Color(0XFFE60004);
  return TextSpan(
    text: title,
    style: GoogleFonts.encodeSansCondensed(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: titleColor,
            fontSize: 20,
            letterSpacing: 0.6)),
  );
}

TextSpan purpleTitle(String title) {
  return TextSpan(
    text: title,
    style: GoogleFonts.encodeSansCondensed(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.purple,
            fontSize: 20,
            letterSpacing: 0.6)),
  );
}

TextSpan greenTitle(String title) {
  const colorGreen = Color(0XFF48D7BC);
  return TextSpan(
    text: title,
    style: GoogleFonts.encodeSansCondensed(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: colorGreen,
            fontSize: 20,
            letterSpacing: 0.6)),
  );
}

TextSpan blackTitle(String title) {
  return TextSpan(
      text: title,
      style: GoogleFonts.encodeSansCondensed(
          textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 0.5)));
}

TextSpan subTitle(String title, double fontSize) {
  return TextSpan(
      text: title,
      style: GoogleFonts.tinos(
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 18, letterSpacing: 0.6)));
}

Widget paragraph(String? paragraph) {
  final textSpans = paragraph!
      .split('\\n')
      .map<InlineSpan>((line) => TextSpan(text: '$line\n'))
      .toList();

  return Text.rich(
    TextSpan(
      children: textSpans,
      style: GoogleFonts.tinos(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          letterSpacing: 0.6,
        ),
      ),
    ),
  );
}


Padding legendePictures(String legende) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10, right: 10),
    child: Text(legende,
        textAlign: TextAlign.center,
        style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 15, letterSpacing: 0.5))),
  );
}

/*TextSpan redTitle2(String title) {
  return TextSpan(
      text: "$title",
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.red, fontSize: 15));
}

TextSpan blackTitle2(String title) {
  return TextSpan(
      text: "$title",
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15));
}*/

TextSpan publishDate(String title) {
  return TextSpan(
      text: title,
      style: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 15, letterSpacing: 0.5)));
}

/*Text paragraph2(String paragraph) {
  return Text("$paragraph",
      style: const TextStyle(color: Colors.black87, fontSize: 8));
}*/

RichText author(String name) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: "par ",
            style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: Colors.black, fontSize: 15, letterSpacing: 0.5))),
        TextSpan(
            text: name,
            style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: titleColor, fontSize: 15, letterSpacing: 0.5))),
      ],
    ),
  );
}

Row articleDetails(String theme, String time, double size) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: RichText(
          text: TextSpan(
            text: theme,
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                  color: Colors.black45, fontSize: 13, letterSpacing: 0.5),
            ),
            children: [
              WidgetSpan(
                child: SizedBox(width: size),
              ),
              TextSpan(
                text: time,
                style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 13,
                        letterSpacing: 0.5)),
              ),
              // WidgetSpan(child: SizedBox(width: size)),
              /*TextSpan(
                text: "Abonnés",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Colors.amber, fontSize: 13, letterSpacing: 0.5),
                ),
              ),*/
            ],
          ),
        ),
      ),
    ],
  );
}

Text appBarMenu(item) {
  return Text(
    "$item",
    style: GoogleFonts.sourceSansPro(
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 18, letterSpacing: 0.5)),
  );
}
