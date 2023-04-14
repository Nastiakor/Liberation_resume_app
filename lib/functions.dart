import 'package:cv_flutter_libe/icons.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/views/homePage.dart';
import 'package:cv_flutter_libe/Controllers/BottomBarArticle.dart';
import 'package:cv_flutter_libe/Controllers/AppBar.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final String imagePath;
  final String title;
  final String titlethen;
  final String paragraphMainArticle;
  final String themeMainArticle;
  final String writtenBy;
  final String publishDateParam;
  final String legendPicture;
  final String completeArticle;
  final String? nextCompleteArticle;
  final String? contactOrNot;
  final String? linkOrNot;
  final String? linkRetroVibes;

  MainArticle(
      {required this.imagePath,
      required this.title,
      required this.titlethen,
      required this.paragraphMainArticle,
      required this.themeMainArticle,
      required this.writtenBy,
      required this.publishDateParam,
      required this.legendPicture,
      required this.completeArticle,
      this.nextCompleteArticle,
      this.contactOrNot,
      this.linkOrNot,
      this.linkRetroVibes});

  // Define the function to calculate the days until the birthday
  String daysUntilArticle() {
    DateTime publishDateParamParsed = DateTime.parse(publishDateParam);
    final DateTime articlePublishingDate = publishDateParamParsed;
    return calculatePublishingDate(articlePublishingDate);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
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
            nextCompleteArticle: nextCompleteArticle,
            contactOrNot: contactOrNot,
            linkOrNot: linkOrNot,
            linkRetroVibes: linkRetroVibes,
          ),
        ),
      ),
      child: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: size.width,
              height: size.width * 9 / 16,
              // set the height to keep the aspect ratio of the image
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: writtenBy == "Johan Anquetil"
                          ? [redTitle(title), blackTitle(titlethen)]
                          : writtenBy == "Anastasia Korotkova"
                              ? [greenTitle(title), blackTitle(titlethen)]
                              : [orangeTitle(title), blackTitle(titlethen)],
                    ),
                  ),
                  const SizedBox(height: 10),
                  paragraph(paragraphMainArticle),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            articleDetails(themeMainArticle, 'Il y a ${daysUntilArticle()}',
                size.width / 6),
            const Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}

class FullArticle extends MainArticle {
  int _currentIndex = 0;
  String? boolContact;
  String? boolLink;

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
    String? nextCompleteArticle,
    String? contactOrNot,
    String? linkOrNot,
    String? linkRetroVibes,
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
          nextCompleteArticle: nextCompleteArticle,
          contactOrNot: contactOrNot,
          linkOrNot: linkOrNot,
          linkRetroVibes: linkRetroVibes,
        );

  @override
  Widget build(BuildContext context) {
    super.contactOrNot?.isEmpty == false
        ? boolContact == true
        : boolContact == false;
    super.linkOrNot?.isEmpty == false ? boolLink == true : boolLink == false;
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
                  padding: EdgeInsets.only(top: 50, left: 15, right: 15),
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
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Wrap(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          sousTitre(super.paragraphMainArticle, 14.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //images
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 8, left: 15),
                    child: byArticle(super.writtenBy)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 15, bottom: 8),
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
              padding: EdgeInsets.only(top: 12, left: 15, right: 15),
              child: legendePictures(super.legendPicture),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, left: 15, right: 15),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: paragraph(super.completeArticle),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                () {
                  return (contactOrNot?.isEmpty ?? true)
                      ? Container()
                      : InkWell(
                          onTap: () {
                            _launchURL('https://github.com/Nastiakor');
                          },
                          child: Image.asset(
                            'img/logos/GitHub_logo.png',
                            width: 100,
                          ),
                        );
                }(),
                () {
                  return (contactOrNot?.isEmpty ?? true)
                      ? Container()
                      : InkWell(
                          onTap: () {
                            _launchURL(
                                'https://www.linkedin.com/in/anastasia-korotkova-682470244/');
                          },
                          child: Image.asset(
                            'img/logos/LinkedIn.png',
                            width: 65,
                          ),
                        );
                }(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, left: 15, right: 15),
              child: () {
                return (nextCompleteArticle?.isEmpty ?? true)
                    ? Container()
                    : Container(
                        alignment: Alignment.bottomLeft,
                        child: paragraph(super.nextCompleteArticle),
                      );
              }(),
            ),
            SizedBox(height: 20),
            // Condition d'affichage
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                () {
                  return (contactOrNot?.isEmpty ?? true)
                      ? Container()
                      : InkWell(
                          onTap: () {
                            _launchURL('https://github.com/JohanAnquetil');
                          },
                          child: Image.asset(
                            'img/logos/GitHub_logo.png',
                            width: 100,
                          ),
                        );
                }(),
                () {
                  return (contactOrNot?.isEmpty ?? true)
                      ? Container()
                      : InkWell(
                          onTap: () {
                            _launchURL(
                                'https://www.linkedin.com/in/johan-anquetil-b3038027/?originalSubdomain=fr');
                          },
                          child: Image.asset(
                            'img/logos/LinkedIn.png',
                            width: 65,
                          ),
                        );
                }(),
              ],
            ),
            () {
              return (linkOrNot?.isEmpty ?? true)
                  ? Container()
                  : Column(
                      children: [
                        Text("Visitez le site d'Ada Tech School :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL(
                                'https://adatechschool.fr/candidater-ecole-dinformatique/?utm_source=google&utm_medium=paid&utm_campaign=generique&utm_term=formation%20d%C3%A9veloppeur&utm_campaign=FR_Paris_G%C3%A9n%C3%A9rique_Ecole/Formation&utm_source=adwords&utm_medium=ppc&hsa_acc=2021439149&hsa_cam=19930091648&hsa_grp=146193322525&hsa_ad=653762257398&hsa_src=g&hsa_tgt=kwd-298137969501&hsa_kw=formation%20d%C3%A9veloppeur&hsa_mt=b&hsa_net=adwords&hsa_ver=3&gclid=CjwKCAjw8-OhBhB5EiwADyoY1Qqi-tYGPEb1b6albpKBebYjizwcm8rUxxgwdamLupz5mrBJk5cG6hoC7mQQAvD_BwE');
                          },
                          child: Image.asset(
                            'img/logos/logo_ada.png',
                            width: 150,
                          ),
                        ),
                      ],
                    );
            }(),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarObject(),
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
  String? nextCompleteArticle;

  SecondaryArticle(
      {required this.imagePath,
      required this.title,
      required this.titlethen,
      required this.paragraphMainArticle,
      required this.themeMainArticle,
      required this.writtenBy,
      required this.publishDateParam,
      required this.legendPicture,
      required this.completeArticle,
      this.nextCompleteArticle});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double maxSize = size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(),
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
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: RichText(
                      text: TextSpan(
                        children: writtenBy == "Johan Anquetil"
                            ? [redTitle(title), blackTitle(titlethen)]
                            : writtenBy == "Anastasia Korotkova"
                                ? [greenTitle(title), blackTitle(titlethen)]
                                : [orangeTitle(title), blackTitle(titlethen)],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: maxSize * 0.3,
                    height: maxSize * 0.3 * 0.75,
                    // set the height to keep the aspect ratio of the image
                    child: ClipRRect(
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: articleDetails(
              themeMainArticle, 'Il y a ${daysUntilArticle()}', size.width / 6),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}

_launchURL(String link) async {
  String url = "$link";
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
