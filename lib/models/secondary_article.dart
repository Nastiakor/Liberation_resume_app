import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/utils/theme/style.dart';
import 'package:cv_flutter_libe/utils/utils.dart';
import 'package:cv_flutter_libe/models/full_article.dart';

// ignore: must_be_immutable
class SecondaryArticle extends StatelessWidget {
  String daysUntilArticle() {
    DateTime publishDateParamParsed = DateTime.parse(publishDateParam);
    final DateTime articlePublishingDate = publishDateParamParsed;
    return calculatePublishingDate(articlePublishingDate);
  }

  String imagePath;
  String titleHeadline;
  String titleOverline;
  String paragraphMainArticle;
  String themeMainArticle;
  String writtenBy;
  String publishDateParam;
  String legendPicture;
  String completeArticle;
  String? nextCompleteArticle;
  String? linkOrNot;
  String? link;
  String? imageOrNot;
  String? image;

  SecondaryArticle(
      {required this.imagePath,
      required this.titleHeadline,
      required this.titleOverline,
      required this.paragraphMainArticle,
      required this.themeMainArticle,
      required this.writtenBy,
      required this.publishDateParam,
      required this.legendPicture,
      required this.completeArticle,
      this.nextCompleteArticle,
      this.link,
      this.linkOrNot,
      this.imageOrNot,
      this.image});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double maxSize = size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(),
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
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
                  link: link,
                  linkOrNot: linkOrNot,
                  imageOrNot: imageOrNot,
                  image: image),
            )),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: RichText(
                      text: TextSpan(
                        children: writtenBy == "Johan Anquetil"
                            ? [
                                redTitle(titleHeadline),
                                blackTitle(titleOverline)
                              ]
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
                  ),
                  const SizedBox(width: 10),
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
          padding: const EdgeInsets.only(top: 10),
          child: articleDetails(
              themeMainArticle, 'Il y a ${daysUntilArticle()}', size.width / 6),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
