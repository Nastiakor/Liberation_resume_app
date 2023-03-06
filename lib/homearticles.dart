import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/main.dart';
import 'package:cv_flutter_libe/functions.dart';

class nastiaHomePresentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    final DateTime articlePublishingDate = DateTime(2023, 02, 28);

// Define the function to calculate the days until the birthday
    String daysUntilArticle() {
      return calculatePublishingDate(articlePublishingDate);
    }

    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 8, right: 8),
                child: Wrap(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: RichText(
                        text: TextSpan(children: [
                          redTitle("NASTIA LA ROUGE "),
                          blackTitle("FROM RUSSIA WITH LOVE")
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Padding 2
          Padding(
            padding: EdgeInsets.only(top: 2, left: 8, right: 8),
            child: Wrap(
              children: [
                Container(
                  child: RichText(
                    text: TextSpan(children: [
                      sousTitre(
                          "Née en Union Soviétique qu'elle connaîtra près d'une décennie avant sa chute, elle a passé une adolescence agitée dans la toute neuve Russie vendue au capitalisme par Gorbatchev."),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          //images

          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8, left: 8),
                  child: byArticle("Anastasia Korotkova")),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8, left: 8, right: 30, bottom: 8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      publishDate("${daysUntilArticle()}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              Image.asset(
                'img/NASTIA.JPG',
                width: size.width,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 20, right: 30),
            child: legendePictures('Go les cocos'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 20, right: 30),
            child: paragraph(
                "Elle a acquis une conscience politique très jeune grâce aux traductions du journal Libération opérées par le S.F.I.O (Syndicat Fédéral d'Iochkar-Ola) envoyés par la section communiste de Bourges avec qui elle n'est pas encore jumelée. Délivrant ses messages philosophico-politiques grâce à l'art du Tag sur les murs de l'agglomération, avec notamment un bien senti 'Mektoub mes couilles', elle a réalisé ses premiers sabotages de navires à l'âge de 6 ans sur les bords du Malaya Kokshaga. Soucieuse de défendre un monde plus juste et la liberté de la presse, elle apprend actuellement les rudiments du développement entre deux manifestations Parisiennes avec en ligne de mire l'intégation à l'équipe de dev de Libé qui doit être formidable."),
          ),
        ],
      )),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key})
      : super(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 50),
                child: Image.asset(
                  'img/1200px-Libération.svg.png',
                  width: 100,
                ),
              ),
            ],
          ),
        );
}
