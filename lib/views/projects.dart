import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(children: [
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
          imagePath: "img/Projets/Pico8.png",
          title: "JEU RETRO PICO 8",
          titlethen: "",
          paragraphMainArticle: "",
          themeMainArticle: "",
          writtenBy: "Anastasia Korotkova",
          publishDateParam: "2023-03-08 16:10:00",
          legendPicture: "",
          completeArticle:
              "- Durée: 2 semaines\n- Moteur: Pico-8\n- Langage : Lua\n\nNotre groupe, composé de 3 personnes, travaillait sur un jeu d'aventure où un pirate doit trouver 3 clés sur une île déserte afin de pouvoir ouvrir un coffre aux trésors.",
        ),
        SecondaryArticle(
          imagePath: "img/Projets/Dataviz.png",
          title: "DATAVIZ & API",
          titlethen: "",
          paragraphMainArticle: "",
          themeMainArticle: "",
          writtenBy: "Anastasia Korotkova",
          publishDateParam: "2023-03-08 16:40:00",
          legendPicture: "",
          completeArticle:
              "- Durée: 2 semaines\n- Langage : JavaScript\n\n.",
        ),
        SecondaryArticle(
          imagePath: "img/Projets/My_mood.png",
          title: "EXTENSION DE NAVIGATEUR",
          titlethen: "",
          paragraphMainArticle: "",
          themeMainArticle: "",
          writtenBy: "Anastasia Korotkova",
          publishDateParam: "2023-03-08 16:40:00",
          legendPicture: "",
          completeArticle:
          "- Durée: 2 semaines\n- Langage : JavaScript\n- Gestion de base de données: MongoDB\n.",
        ),
        SecondaryArticle(
          imagePath: "",
          title: "RESEAU SOCIAL PHP",
          titlethen: "",
          paragraphMainArticle: "",
          themeMainArticle: "",
          writtenBy: "Anastasia Korotkova",
          publishDateParam: "2023-03-08 17:10:00",
          legendPicture: "",
          completeArticle:
          "- Durée: 2 semaines\n- Langage : JavaScript\n- Gestion de base de données: MongoDB\n.",
        ),
      ]),
    );
  }
}
