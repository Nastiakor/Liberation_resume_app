import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/utils/theme/style.dart';
import 'package:cv_flutter_libe/utils/utils.dart';
import 'package:cv_flutter_libe/models/full_article.dart';


class MainArticle extends StatelessWidget {
  final String imagePath;
  final String titleOverline;
  final String titleHeadline;
  final String paragraphMainArticle;
  final String themeMainArticle;
  final String writtenBy;
  final String publishDateParam;
  final String legendPicture;
  final String completeArticle;
  final String? nextCompleteArticle;
  final String? contactOrNot;
  final String? linkOrNot;
  final String? link;
  final String? imageOrNot;
  final String? image;

  MainArticle(
      {required this.imagePath,
        required this.titleOverline,
        required this.titleHeadline,
        required this.paragraphMainArticle,
        required this.themeMainArticle,
        required this.writtenBy,
        required this.publishDateParam,
        required this.legendPicture,
        required this.completeArticle,
        this.nextCompleteArticle,
        this.contactOrNot,
        this.linkOrNot,
        this.link,
        this.imageOrNot,
        this.image});

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
              titleHeadline: titleHeadline,
              titleOverline: titleOverline,
              paragraphMainArticle: paragraphMainArticle,
              themeMainArticle: themeMainArticle,
              publishDateParam: publishDateParam,
              writtenBy: writtenBy,
              legendPicture: legendPicture,
              completeArticle: completeArticle,
              nextCompleteArticle: nextCompleteArticle,
              contactOrNot: contactOrNot,
              linkOrNot: linkOrNot,
              link: link,
              imageOrNot: imageOrNot,
              image: image),
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
                          ? [redTitle(titleHeadline), blackTitle(titleOverline)]
                          : writtenBy == "Anastasia Korotkova"
                          ? [
                        greenTitle(titleHeadline),
                        blackTitle(titleOverline)
                      ]
                          : [
                        purpleTitle(titleHeadline),
                        blackTitle(titleOverline)
                      ],
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