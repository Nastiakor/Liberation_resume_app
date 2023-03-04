import 'package:cv_flutter_libe/icons.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/homearticles.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/views/homePage.dart';
import 'dart:ffi';

String calculatePublishingDate(DateTime publishingDate) {
  DateTime now = DateTime.now();
  DateTime howLongFromNow =
  DateTime(publishingDate.year, publishingDate.month, publishingDate.day,
      publishingDate.minute);
print(now);
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
  } else if (durationinMinute < 1) {
    return "$durationinMinute minute";
  } else if (durationinHours > 1 && durationinHours < 24) {
    return "$durationinHours heures";}
  else if (durationinHours == 1) {
    return "$durationinHours heure";
  } else return "erreur";

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
  String writtenBy;
  String publishDateParam;
  bool hiddenArticle = false;

  MainArticle({
    required this.imagePath,
    required this.title,
    required this.titlethen,
    required this.paragraphMainArticle,
    required this.themeMainArticle,
    required this.writtenBy,
    required this.publishDateParam,
  });

// Define the function to calculate the days until the birthday
  String daysUntilArticle() {
    DateTime publishDateParamParsed = DateTime.parse(publishDateParam);
    final DateTime articlePublishingDate = publishDateParamParsed;
    return calculatePublishingDate(articlePublishingDate);
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
    InkWell(
    onTap: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainArticleComplete(
      completeArticle: "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécie le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...).",
      legend: "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
      imagePath: imagePath,
      title: title,
      titlethen: titlethen,
      paragraphMainArticle: paragraphMainArticle,
      themeMainArticle: themeMainArticle,
      publishDateParam: publishDateParam,
      writtenBy: writtenBy,),)),
          child: Container(
            width: size.width,
            child: Image.asset(imagePath,
                width: size.width, fit: BoxFit.cover),
          ),),
        ],
      ),
      InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainArticleComplete(
          completeArticle: "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécie le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...).",
          legend: "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
          imagePath: imagePath,
        title: title,
        titlethen: titlethen,
        paragraphMainArticle: paragraphMainArticle,
        themeMainArticle: themeMainArticle,
        publishDateParam: publishDateParam,
        writtenBy: writtenBy,),)),
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

class MainArticleComplete extends MainArticle {
  String completeArticle;
  String legend;
  MainArticleComplete({
    required String imagePath,
    required String title,
    required String titlethen,
    required String paragraphMainArticle,
    required String themeMainArticle,
    required String writtenBy,
    required String publishDateParam,
    required this.completeArticle,
    required this.legend,

  }) : super(
    imagePath: imagePath,
    title: title,
    titlethen: titlethen,
    paragraphMainArticle: paragraphMainArticle,
    themeMainArticle: themeMainArticle,
    writtenBy: writtenBy,
    publishDateParam: publishDateParam,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthMax = size.width;
    var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: megaGigaFunction(
            super.title,
            super.titlethen,
            super.paragraphMainArticle,
            super.writtenBy,
            super.publishDateParam,
            super.imagePath,
            legend,
            completeArticle,
            "$widthMax"),),
    );
  }

// other methods and widgets
}
