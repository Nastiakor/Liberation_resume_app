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
    String mainTitle,
    String blackTitleVar,
    String sousTitreVar,
    String writtenBy,
    String publishDateParam,
    String imageAssetpath,
    String legendePicturesVar,
    String paragraphVar,
    String sizeWidth,
    ) {
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
                      text: TextSpan(
                          children: writtenBy == "Johan Anquetil"
                              ? [
                                  redTitle("$mainTitle"),
                                  blackTitle("$blackTitleVar")
                                ]
                              : writtenBy == "Anastasia Korotkova"
                                  ? [
                                      greenTitle("$mainTitle"),
                                      blackTitle("$blackTitleVar")
                                    ]
                                  : [
                                      orangeTitle("$mainTitle"),
                                      blackTitle("$blackTitleVar")
                                    ])),
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
              child: byArticle("$writtenBy")),
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

class MainArticle extends StatelessWidget {
  String imagePath;
  String title;
  String titlethen;
  String paragraphMainArticle;
  String themeMainArticle;
  String publishDate;
  String writtenBy;
  MainArticle({required this.imagePath, required this.title, required this.titlethen, required this.paragraphMainArticle, required this.themeMainArticle, required this.publishDate, required this.writtenBy});

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          Container(
            width: size.width,
            child: Image.asset(imagePath,
                width: size.width, fit: BoxFit.cover),
          ),
        ],
      ),
      InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => firstHomeArticle())),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 5),
          child: Wrap(
            children: [
              RichText(
                text: TextSpan(children: writtenBy == "Johan Anquetil"
                    ? [
                  redTitle(title),
                  blackTitle(titlethen)
                ]
                    : writtenBy == "Anastasia Korotkova"
                    ? [
                  greenTitle(title),
                  blackTitle(titlethen)
                ]
                    : [
                  orangeTitle(title),
                  blackTitle(titlethen)
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 7,
                  left: 4,
                ),
                child: paragraph(paragraphMainArticle),
              ),
            ],
          ),
        ),
      ),
      Row(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          theme(themeMainArticle),
          time(publishDate),
          abonne(),
          bookmark(),
        ],
      ),
      Divider(
        thickness: 2,
      ),
    ]);

  }
}
