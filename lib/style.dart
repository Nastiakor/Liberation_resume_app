import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/main.dart';


TextSpan redTitle(String title) {
  return TextSpan(
    text: "$title",
    style:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20),
  );
}

TextSpan blackTitle(String title) {
  return TextSpan(
      text: "$title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20));
}

TextSpan sousTitre(String title) {
  return TextSpan(
      text: "$title", style: TextStyle(color: Colors.black, fontSize: 16));
}

Text paragraph(String paragraph) {
  return Text("$paragraph",
      style: TextStyle(color: Colors.black87, fontSize: 15, height: 1.6));
}

Padding legendePictures(String legende) {
  return Padding(
    padding: EdgeInsets.only(left: 10, top: 5, bottom: 10, right: 10),
    child: Text(
      "$legende",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black87, fontSize: 13),
    ),
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
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black45, fontSize: 14));
}

Text paragraph2(String paragraph) {
  return Text("$paragraph",
      style: TextStyle(color: Colors.black87, fontSize: 8));
}

RichText byArticle(String name) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(text: "par ", style: TextStyle(color: Colors.black)),
        TextSpan(text: "$name", style: TextStyle(color: Colors.red))
      ],
    ),
  );
}

Expanded theme(String theme) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "$theme",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 13),
          ),
        ),
      ),
    ),
  );
}

Expanded time(String time) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(right: 0),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "$time",
            style: TextStyle(color: Colors.black45, fontSize: 13),
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
            text: "Abonné",
            style: TextStyle(color: Colors.amber, fontSize: 13),
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
}
Column megaGigaFunction(String redTitleVar, String blackTitleVar, String sousTitreVar, String byArticleVar, String publishDateVar, String imageAssetpath, String legendePicturesVar, String paragraphVar) {
  return Column(
    children: [
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 8, right: 8),
            child: Wrap(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: TextSpan(children: [
                      redTitle("$redTitleVar"),
                      blackTitle("$blackTitleVar")
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Padding 2
      Padding(
        padding: EdgeInsets.only(top: 2, left: 8, right: 8),
        child: Wrap(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: RichText(
                text: TextSpan(children: [
                  sousTitre(
                      "$sousTitreVar"),
                ]),
              ),
            ),
          ],
        ),
      ),
      //images

      Row(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8, left: 8),
              child: byArticle("$byArticleVar")),
        ],
      ),
      Row(
        children: [
          Padding(
            padding:
            EdgeInsets.only(top: 8, left: 8, right: 30, bottom: 8),
            child: RichText(
              text: TextSpan(
                children: [
                  publishDate("$publishDateVar"),
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            '$imageAssetpath',
            width: 400,
            fit: BoxFit.cover,
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 12, left: 20, right: 30),
        child: legendePictures("$legendePicturesVar"),
      ),

      Padding(
          padding: EdgeInsets.only(top: 12, left: 20, right: 30),
            child: Container(
            alignment: Alignment.bottomLeft,
              child: paragraph(
            "$paragraphVar"),
      ),),
    ],
  );
}



