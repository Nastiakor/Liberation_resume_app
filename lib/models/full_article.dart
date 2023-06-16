import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/utils/theme/style.dart';
import 'package:cv_flutter_libe/models/main_article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_flutter_libe/views/components/bottom_bar_article.dart';

// ignore: must_be_immutable
class FullArticle extends MainArticle {
  String? boolContact;
  String? boolLink;
  String? boolImage;

  FullArticle(
      {required String imagePath,
        required String titleHeadline,
        required String titleOverline,
        required String paragraphMainArticle,
        required String themeMainArticle,
        required String writtenBy,
        required String publishDateParam,
        required String legendPicture,
        required String completeArticle,
        String? nextCompleteArticle,
        String? contactOrNot,
        String? linkOrNot,
        String? link,
        String? imageOrNot,
        String? image})
      : super(
      imagePath: imagePath,
      titleOverline: titleOverline,
      titleHeadline: titleHeadline,
      paragraphMainArticle: paragraphMainArticle,
      themeMainArticle: themeMainArticle,
      writtenBy: writtenBy,
      publishDateParam: publishDateParam,
      legendPicture: legendPicture,
      completeArticle: completeArticle,
      nextCompleteArticle: nextCompleteArticle,
      contactOrNot: contactOrNot,
      linkOrNot: linkOrNot,
      link: link,
      imageOrNot: imageOrNot,
      image: image);

  @override
  Widget build(BuildContext context) {
    print("LON $linkOrNot");
    print("link ${link?.isEmpty}");
    print("image $imageOrNot");
    super.contactOrNot?.isEmpty == false
        ? boolContact == true
        : boolContact == false;
    super.linkOrNot?.isEmpty == false ? boolLink == true : boolLink == false;
    super.imageOrNot?.isEmpty == false ? boolImage == true : boolImage == false;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'img/j&a.png',
              width: 50,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: Wrap(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                            text: TextSpan(
                                children: writtenBy == "Johan Anquetil"
                                    ? [
                                  redTitle(super.titleHeadline),
                                  blackTitle(super.titleOverline)
                                ]
                                    : writtenBy == "Anastasia Korotkova"
                                    ? [
                                  greenTitle(super.titleHeadline),
                                  blackTitle(super.titleOverline)
                                ]
                                    : [
                                  purpleTitle(super.titleHeadline),
                                  blackTitle(super.titleOverline)
                                ])),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Padding 2
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Wrap(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          subTitle(super.paragraphMainArticle, 14.0),
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
                    padding: const EdgeInsets.only(top: 8, left: 15),
                    child: author(super.writtenBy)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15, bottom: 8),
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
              padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
              child: legendePictures(super.legendPicture),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: paragraph(super.completeArticle),
              ),
            ),
            const SizedBox(height: 20),
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
            Row(
              children: [
                    () {
                  return (contactOrNot?.isEmpty ?? true)
                      ? Container()
                      : const SizedBox(height: 20);
                }(),
              ],
            ),
                () {
              return (contactOrNot?.isEmpty ?? true)
                  ? Container()
                  : const SizedBox(height: 10);
            }(),
                () {
              return (contactOrNot?.isEmpty ?? true)
                  ? Container()
                  : const Divider(thickness: 2);
            }(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: () {
                return (nextCompleteArticle?.isEmpty ?? true)
                    ? Container()
                    : Container(
                  alignment: Alignment.bottomLeft,
                  child: paragraph(super.nextCompleteArticle),
                );
              }(),
            ),
            const SizedBox(height: 20),
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
              return (link?.isEmpty ?? true)
                  ? Container()
                  : InkWell(
                  onTap: () {
                    _launchURL("$link");
                    print("linkOrNot$link");
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: const Text(
                        'Visitez le site en cliquant ici',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ));
            }(),
                () {
              return (image?.isEmpty ?? true)
                  ? Container()
                  : Column(
                children: [
                  //       const Text(
                  //         "Visitez le site d'Ada Tech School :",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, fontSize: 18),
                  //       ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL("$link");
                    },
                    child: Image.asset(
                      "$image",
                      width: 150,
                    ),
                  ),
                ],
              );
            }(),
            // //   () {
            // //   return (linkGhibli?.isEmpty ?? true)
            // //       ? Container()
            // //       : InkWell(
            // //       onTap: () {
            // //         _launchURL(
            // //             'http://johananquetil.fr/Ghibliproject/');
            // //       },
            // //       child: Align(
            // //         alignment: Alignment.topRight,
            // //         child: Container(
            // //           margin: const EdgeInsets.only(right: 20.0),
            // //           child: const Text(
            // //             'Visitez le site en cliquant ici',
            // //             style: TextStyle(
            // //               color: Colors.blue,
            // //               decoration: TextDecoration.underline,
            // //             ),
            // //           ),
            // //         ),
            // //       )
            // //   );
            // // }(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBarArticle(),
    );
  }
// other methods and widgets
}

Future<void> _launchURL(String link) async {
  final Uri _url = Uri.parse(link);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}