import 'package:cv_flutter_libe/icons.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/views/homePage.dart';
import 'package:cv_flutter_libe/Controllers/BottomBarArticle.dart';
import 'package:cv_flutter_libe/Controllers/AppBar.dart';

String calculatePublishingDate(DateTime publishingDate) {
  DateTime now = DateTime.now();
  DateTime howLongFromNow = DateTime(publishingDate.year, publishingDate.month,
      publishingDate.day, publishingDate.hour, publishingDate.minute);
  Duration duration = now.difference(howLongFromNow);
  int durationInDays = duration.inDays;
  int durationinMinute = duration.inMinutes;
  int durationinHours = duration.inHours;
  if (durationInDays == 1) {
    return "$durationInDays jour";
  } else if (durationInDays > 1) {
    return "$durationInDays jours";
  } else if (durationinHours < 1 && durationinMinute > 1) {
    return "$durationinMinute minutes";
  } else if (durationinMinute <= 1) {
    return "$durationinMinute minute";
  } else if (durationinHours > 1 && durationinHours < 24) {
    return "$durationinHours heures";
  } else if (durationinHours == 1) {
    return "$durationinHours heure";
  } else
    return "erreur";
}

class MainArticle extends StatelessWidget {
  int _currentIndex = 0;
  String imagePath;
  String title;
  String titlethen;
  String paragraphMainArticle;
  String themeMainArticle;
  String writtenBy;
  String publishDateParam;
  String legendPicture;
  String completeArticle;

  MainArticle(
      {required this.imagePath,
      required this.title,
      required this.titlethen,
      required this.paragraphMainArticle,
      required this.themeMainArticle,
      required this.writtenBy,
      required this.publishDateParam,
      required this.legendPicture,
      required this.completeArticle});

// Define the function to calculate the days until the birthday
  String daysUntilArticle() {
    DateTime publishDateParamParsed = DateTime.parse(publishDateParam);
    final DateTime articlePublishingDate = publishDateParamParsed;
    return calculatePublishingDate(articlePublishingDate);
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    print(legendPicture);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FullArticle(
                imagePath: imagePath,
                title: title,
                titlethen: titlethen,
                paragraphMainArticle: paragraphMainArticle,
                themeMainArticle: themeMainArticle,
                publishDateParam: publishDateParam,
                writtenBy: writtenBy,
                legendPicture: legendPicture,
                completeArticle: completeArticle,
              ),
            )),
            child: Container(
              width: size.width,
              child:
                  Image.asset(imagePath, width: size.width, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FullArticle(
              imagePath: imagePath,
              title: title,
              titlethen: titlethen,
              paragraphMainArticle: paragraphMainArticle,
              themeMainArticle: themeMainArticle,
              publishDateParam: publishDateParam,
              writtenBy: writtenBy,
              legendPicture: legendPicture,
              completeArticle: completeArticle),
        )),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 5),
          child: Wrap(
            children: [
              RichText(
                text: TextSpan(
                    children: writtenBy == "Johan Anquetil"
                        ? [redTitle(title), blackTitle(titlethen)]
                        : writtenBy == "Anastasia Korotkova"
                            ? [greenTitle(title), blackTitle(titlethen)]
                            : [orangeTitle(title), blackTitle(titlethen)]),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 7,
                  left: 4,
                  bottom: 10,
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
          time("Il y a ${daysUntilArticle()}"),
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


class FullArticle extends MainArticle {

int _currentIndex = 0;

  FullArticle({
    required String imagePath,
    required String title,
    required String titlethen,
    required String paragraphMainArticle,
    required String themeMainArticle,
    required String writtenBy,
    required String publishDateParam,
    required String legendPicture,
    required String completeArticle,
  }) : super(
          imagePath: imagePath,
          title: title,
          titlethen: titlethen,
          paragraphMainArticle: paragraphMainArticle,
          themeMainArticle: themeMainArticle,
          writtenBy: writtenBy,
          publishDateParam: publishDateParam,
          legendPicture: legendPicture,
          completeArticle: completeArticle,
        );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthMax = size.width;
    var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
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
                                        redTitle(super.title),
                                        blackTitle(super.titlethen)
                                      ]
                                    : writtenBy == "Anastasia Korotkova"
                                        ? [
                                            greenTitle(super.title),
                                            blackTitle(super.titlethen)
                                          ]
                                        : [
                                            orangeTitle(super.title),
                                            blackTitle(super.titlethen)
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
                        sousTitre(super.paragraphMainArticle, 14.0),
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
                    child: byArticle(super.writtenBy)),
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
                        publishDate("Publié il y a ${daysUntilArticle()}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  super.imagePath,
                  fit: BoxFit.cover,
                  width: size.width,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, left: 20, right: 30),
              child: legendePictures(super.legendPicture),
            ),

            Padding(
              padding: EdgeInsets.only(top: 12, left: 20, right: 30),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: paragraph(super.completeArticle),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomBarObject()
    );
  }
// other methods and widgets
}

class SecondaryArticle extends StatelessWidget {
  String daysUntilArticle() {
    DateTime publishDateParamParsed = DateTime.parse(publishDateParam);
    final DateTime articlePublishingDate = publishDateParamParsed;
    return calculatePublishingDate(articlePublishingDate);
  }

  String imagePath;
  String title;
  String titlethen;
  String paragraphMainArticle;
  String themeMainArticle;
  String writtenBy;
  String publishDateParam;
  String legendPicture;
  String completeArticle;

  SecondaryArticle({
    required this.imagePath,
    required this.title,
    required this.titlethen,
    required this.paragraphMainArticle,
    required this.themeMainArticle,
    required this.writtenBy,
    required this.publishDateParam,
    required this.legendPicture,
    required this.completeArticle,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double maxSize = size.width;
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 7, left: 4),
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FullArticle(
              imagePath: imagePath,
              title: title,
              titlethen: titlethen,
              paragraphMainArticle: paragraphMainArticle,
              themeMainArticle: themeMainArticle,
              publishDateParam: publishDateParam,
              writtenBy: writtenBy,
              legendPicture: legendPicture,
              completeArticle: completeArticle,
            ),
          )),
          child: Row(children: [
            Expanded(
              flex: 2,
              child: Wrap(
                children: [
                  RichText(
                    text: TextSpan(
                        children: writtenBy == "Johan Anquetil"
                            ? [redTitle(title), blackTitle(titlethen)]
                            : writtenBy == "Anastasia Korotkova"
                                ? [greenTitle(title), blackTitle(titlethen)]
                                : [orangeTitle(title), blackTitle(titlethen)]),
                  ),
                ],
              ),
            ),
            Expanded(child: Image.asset(imagePath)),
          ]),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, left: 5),
        child: Row(
          children: [
            theme(themeMainArticle),
            time('Il y a ${daysUntilArticle()}'),
            abonne(),
            bookmark()
          ],
        ),
      ),
      Divider(
        thickness: 2,
      ),
    ]);
  }
}
