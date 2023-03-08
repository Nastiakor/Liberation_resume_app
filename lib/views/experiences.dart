import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';

class Experiences extends StatelessWidget {
  const Experiences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(children: [
        MainArticle(
          imagePath: "img/Experiences/Full-lobby-Hotel-Fabric.webp",
          title: "2018 - 2022 RECEPTIONNISTE",
          titlethen: " HOTELS A PARIS",
          paragraphMainArticle:
              "Accueil et renseignement de la clientèle, conciergerie, travail administratif, réponses aux commentaires des clients sur divers sites web, rédaction et traduction en anglais des brochures de communication",
          themeMainArticle: "",
          writtenBy: "Anastasia Korotkova",
          publishDateParam: "2023-03-06 15:13:00",
          legendPicture: "",
          completeArticle:
              "- 2021 - 2022 Hôtel Paradis\n- 2018 - 2020 Hôtel Fabric\n- 2017 - 2018 Hôtel des Marronniers\n",
        ),
        SecondaryArticle(
          imagePath: "img/Experiences/ERGONCAPITALPARTNERS.png",
          title:
              "2010 - 2016 ASSISTANTE DE DIRECTION GÉNÉRALE / OFFICE MANAGER",
          titlethen: " ",
          paragraphMainArticle:
              "Accueil physique et téléphonique, interprétariat, traduction de documents, gestion d'agenda, organisation de réunions et de déplacements, gestion des dépenses, organisation du bureau",
          themeMainArticle: "",
          writtenBy: "Anastasia Korotkova",
          publishDateParam: "2023-03-06 10:13:00",
          legendPicture: "",
          completeArticle:
              "- 2014 - 2016 Ergon Capital Advisors France\n- 2011 - 2014 Rietumu Bank\n- 2010 Moreno, Ruby et associés",
        ),
        SecondaryArticle(
          imagePath: "img/Experiences/CiteDeLaMusique.jpg",
          title:
              "2011 HOTESSE D'ACCUEIL",
          titlethen: " CITÉ DE LA MUSIQUE",
          paragraphMainArticle:
              "Accueil et renseignement des visiteurs, en français et en anglais. Préparation et organisation des évènements culturels. Traduction de brochures et de documents publicitaires (français - anglais)",
          themeMainArticle: "",
          writtenBy: "Anastasia Korotkova",
          publishDateParam: "2023-03-06 10:13:00",
          legendPicture: "",
          completeArticle:
              "",
        ),
      ]),
    );
  }
}
