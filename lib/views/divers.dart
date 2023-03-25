import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';

class Divers extends StatelessWidget {
  const Divers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          MainArticle(
            imagePath: "",
            title: " ",
            titlethen: "",
            paragraphMainArticle: "",
            themeMainArticle: "",
            writtenBy: "",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture: "",
            completeArticle: "",
          ),
          SecondaryArticle(
            imagePath: "",
            title: "",
            titlethen: "",
            paragraphMainArticle: "",
            themeMainArticle: "",
            writtenBy: "",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture: "",
            completeArticle: "",
          ),
        ],
      ),
    );
  }
}
