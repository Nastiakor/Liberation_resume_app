import 'package:cv_flutter_libe/Controllers/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/main.dart';
import 'package:cv_flutter_libe/functions.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_fonts/google_fonts.dart';

double _fontSize = 16.0;

TextSpan redTitle(String title) {
  const titleColor = Color(0XFFE60004);
  return TextSpan(
    text: "$title",
    style: GoogleFonts.encodeSansCondensed(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: titleColor,
            fontSize: 20,
            letterSpacing: 0.6)),
  );
}

TextSpan orangeTitle(String title) {
  return TextSpan(
    text: "$title",
    style: GoogleFonts.encodeSansCondensed(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.purple,
            fontSize: 20,
            letterSpacing: 0.6)),
  );
}

TextSpan greenTitle(String title) {
  const colorGreen = Color(0XFF48D7BC);
  return TextSpan(
    text: "$title",
    style: GoogleFonts.encodeSansCondensed(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorGreen,
            fontSize: 20,
            letterSpacing: 0.6)),
  );
}

TextSpan blackTitle(String title) {
  return TextSpan(
      text: "$title",
      style: GoogleFonts.encodeSansCondensed(
          textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 0.5)));
}

TextSpan sousTitre(String title, double fontSize) {
  return TextSpan(
      text: "$title",
      style: GoogleFonts.tinos(
          textStyle: TextStyle(
              color: Colors.black, fontSize: 18, letterSpacing: 0.6)));
}

Text paragraph(String? paragraph) {
  return Text("$paragraph",
      style: GoogleFonts.tinos(
          textStyle: TextStyle(
              color: Colors.black, fontSize: 18, letterSpacing: 0.6)));
}

Padding legendePictures(String legende) {
  return Padding(
    padding: EdgeInsets.only(left: 10, top: 5, bottom: 10, right: 10),
    child: Text("$legende",
        textAlign: TextAlign.center,
        style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
                color: Colors.black, fontSize: 15, letterSpacing: 0.5))),
  );
}

TextSpan redTitle2(String title) {
  return TextSpan(
      text: "$title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.red, fontSize: 15));
}

TextSpan blackTitle2(String title) {
  return TextSpan(
      text: "$title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15));
}

TextSpan publishDate(String title) {
  return TextSpan(
      text: "$title",
      style: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
              color: Colors.black, fontSize: 15, letterSpacing: 0.5)));
}

Text paragraph2(String paragraph) {
  return Text("$paragraph",
      style: TextStyle(color: Colors.black87, fontSize: 8));
}

RichText byArticle(String name) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: "par ",
            style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                    color: Colors.black, fontSize: 15, letterSpacing: 0.5))),
        TextSpan(
            text: "$name",
            style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                    color: titleColor, fontSize: 15, letterSpacing: 0.5))),
      ],
    ),
  );
}

Row articleDetails(String theme, String time, double size) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15),
        child: RichText(
          text: TextSpan(
            text: "$theme",
            style: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(
                  color: Colors.black45, fontSize: 13, letterSpacing: 0.5),
            ),
            children: [
              WidgetSpan(
                child: SizedBox(width: size),
              ),
              TextSpan(
                text: "$time",
                style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
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

/*Expanded time(String time) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(right: 0),
      child: Container(
        child: RichText(
          text: TextSpan(

          ),
        ),
      ),
    ),
  );
}

Expanded abonne() {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "Abonnés",
            style: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(
                  color: Colors.amber, fontSize: 13, letterSpacing: 0.5),
            ),
          ),
        ),
      ),
    ),
  );
}

Expanded bookmark() {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Icon(Icons.bookmark_border)],
      ),
    ),
  );
}*/

Text appBarMenu(item) {
  return Text(
    "$item",
    style: GoogleFonts.sourceSansPro(
        textStyle:
            TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 0.5)),
  );
}
