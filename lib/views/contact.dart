import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/view_articles_main_full_secondary.dart';


void main() => runApp(const Contact());

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MainArticle(
                imagePath: "img/contact.png",
                title: "NOUS ",
                titlethen: "CONTACTER",
                paragraphMainArticle:
                    "Vous êtes intéressé par nos profils pour renforcer vos équipes dans le cadre d'une alternance d'un an ?",
                themeMainArticle: "Contact",
                writtenBy: "Johan et Anastasia",
                publishDateParam: "2023-03-10 19:36:00",
                legendPicture: "",
                completeArticle:
                    "Vous pouvez nous joindre : \n\nAnastasia Korotkova\n\n    * Par téléphone au 06-37-03-68-45\n    * Par mail à a.korotkova@yahoo.fr",
                nextCompleteArticle: "Johan Anquetil \n\n    * Par téléphone au 06-23-32-03-21 \n    * Par mail à anquetil.johan@laposte.net",
                contactOrNot: "Contacts à afficher",
              ),
            ],
          ),
        ),
    );
  }
}
