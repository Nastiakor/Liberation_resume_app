import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          MainArticle(
            imagePath: "img/contact.webp",
            title: "NOUS ",
            titlethen: "CONTACTER",
            paragraphMainArticle:
                "Vous êtes intéressé.e par nos profils pour renforcer vos équipes dans le cadre d'une alternance en un an ?",
            themeMainArticle: "Contact",
            writtenBy: "Johan et Anastasia",
            publishDateParam: "2023-03-10 19:36:00",
            legendPicture: "",
            completeArticle:
                "Vous pouvez nous joindre : \n\nAnastasia Korotkova\n    * Par téléphone au 06-37-03-68-45\n    * Par mail à a.korotkova@yahoo.fr\n\nJohan Anquetil \n    * Par téléphone au 06-23-32-03-21 \n    * Par mail à anquetil.johan@laposte.net",
          ),
        ],
      ),
    );
  }
}
