import 'package:cv_flutter_libe/icons.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/homearticles.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/views/homePage.dart';
import 'dart:ffi';

String calculatePublishingDate(DateTime publishingDate) {
  DateTime now = DateTime.now();
  DateTime howLongFromNow =
      DateTime(publishingDate.year, publishingDate.month, publishingDate.day);

  Duration duration = now.difference(howLongFromNow);
  int durationInDays = duration.inDays;
  if (durationInDays == 1) {
    return "Publié il y a $durationInDays jour";
  } else {
    return "Publié il y a $durationInDays jours";
  }
}

Column megaGigaFunction(
    String redTitleVar,
    String blackTitleVar,
    String sousTitreVar,
    String byArticleVar,
    String publishDateParam,
    String imageAssetpath,
    String legendePicturesVar,
    String paragraphVar,
    String sizeWidth) {
  double sizeWidthParsed = double.parse(sizeWidth);

  DateTime publishDateParamParsed = DateTime.parse(publishDateParam);

  final DateTime articlePublishingDate = publishDateParamParsed;

// Define the function to calculate the days until the birthday
  String daysUntilArticle() {
    return calculatePublishingDate(articlePublishingDate);
  }

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
                  sousTitre("$sousTitreVar"),
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
            padding: EdgeInsets.only(top: 8, left: 8, right: 30, bottom: 8),
            child: RichText(
              text: TextSpan(
                children: [
                  publishDate("${daysUntilArticle()}"),
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
            fit: BoxFit.cover,
            width: sizeWidthParsed,
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
          child: paragraph("$paragraphVar"),
        ),
      ),
    ],
  );
}
