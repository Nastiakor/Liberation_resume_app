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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: size.width,
                child: Image.asset(
                    'img/85808-cherche-ancien-affiche-vectoriel.jpg',
                    width: size.width,
                    fit: BoxFit.cover),
              ),
            ],
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => firstHomeArticle())),
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: Wrap(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      redTitle("WANTED "),
                      blackTitle(
                          "DEUX ÉTUDIANTS POSSÉDANT DE FORTES COMPÉTENCES EN FLUTTER. RÉCOMPENSE: ALTERNANCE"),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 7,
                      left: 4,
                    ),
                    child: paragraph(
                        "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération."),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              theme("Chômage"),
              time("Il y a 5 minutes"),
              abonne(),
              bookmark(),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Wrap(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    nastiaHomePresentation())),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              redTitle2("NASTIA LA ROUGE "),
                              blackTitle2("FROM MARIS WITH LOVE "),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => nastiaHomePresentation(),
                          ),
                        ),
                        child: Image.asset(
                          'img/NASTIA.JPG',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              theme("Candidature"),
              time("Il y a 25 minutes"),
              abonne(),
              bookmark(),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Wrap(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    jojoHomePresentation())),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              redTitle2("JOJO LE BOX-TO-BOX "),
                              blackTitle2(
                                  "POLYVALENT ET DETERMINE QUELQUE SOIT SON POSTE SUR LA GAUCHE DU TERRAIN"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Container(
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => jojoHomePresentation())),
                            child: Image.asset(
                              'img/JOHAN.JPG',
                            ),
                          )),
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              theme("Révolution"),
              time("Il y a 45 minutes"),
              abonne(),
              bookmark(),
            ],
          ),
        ],
      ),
    );
  }
}