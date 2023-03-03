import 'package:cv_flutter_libe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/functions.dart';
import 'package:cv_flutter_libe/homearticles.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
        children :[
          MainArticle(
            imagePath: "img/85808-cherche-ancien-affiche-vectoriel.jpg",
            title: "WANTED ",
            titlethen: "DEUX ETUDIANTS FLUTTER ET APPS MOBILES EN RECHERCHE D'ALTERNANCE. RECOMPENSE : DEUX BOMBES",
            paragraphMainArticle: "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération.",
            themeMainArticle: "Chômage",
            publishDate: "Il y a 10 minutes",
            writtenBy: "Anastasia et Johan",
          ),
        ],
          ),
    );
  }
}