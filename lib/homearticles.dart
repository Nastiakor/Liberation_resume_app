import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/main.dart';

class jojoHomePresentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 20, right: 30),
                child: Wrap(
                  children: [
                    Container(
                      child: RichText(
                        text: TextSpan(children: [
                          redTitle2("JOJO LE BOX-TO-BOX "),
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
            padding: EdgeInsets.only(top: 2, left: 20, right: 30),
            child: Wrap(
              children: [
                Container(
                  child: RichText(
                    text: TextSpan(children: [
                      sousTitre(
                          "Aussi à l'aise à la récupération grâce à sa fougue, à la relance avec son énergie ou en meneur de jeu avec sa créativité et sa vision stratégique, ses expériences de la gestion de projet, de la mobilisation citoyenne et du développement du pouvoir d'agir dans différents mouvements d'éducation populaire, lui permettent d'avoir de nombreuses cartes de son jeu. "),
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
                  padding: EdgeInsets.only(top: 8, left: 20, right: 30),
                  child: byArticle("Johan Anquetil")),
            ],
          ),
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 8, left: 20, right: 30, bottom: 8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      publishDate("Publié le 26 Février 2023 à 10h20"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              Image.asset(
                'img/JOHAN.JPG',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 20, right: 30),
            child: legendePictures(
                "Photographie prise après une manifestation pacifique de libération des poulets du monde et contre l'oppression animale"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 20, right: 30),
            child: paragraph(
                "Aussi à l'aise à la récupération grâce à sa fougue, à la relance avec son énergie ou en meneur de jeu avec sa créativité et sa vision stratégique, ses expériences de la gestion de projet, de la mobilisation citoyenne et du développement du pouvoir d'agir dans différents mouvements d'éducation populaire, lui permettent d'avoir de nombreuses cartes de son jeu... Convaincu que la démocratie devrait être plus participative et que l'engagement citoyen est conditionné à être éclairé, il souhaite participer aux projets Tech de Libé qui est fondamental selon lui pour conscientiser les citoyens sur les grands sujets de société et favoriser la compréhension des enjeux contemporains. Pas fan de la propriété, ni de l'héritage, il se rêve en Che Guevarra (les purges en moins) sur son vélib certains soirs, parcourant la banlieue parisienne. Un peu bobo, un peu beauf, il squatte Bauer et ne jure que par l'étoile rouge. Un peu austère, il ne boit pas d'alcool, ne fume pas, ne mange pas de cadavres et est contre l'avion. Mais comme le prouve la photo, il sait être drôle parfois.\n\nEst aussi fièrement abonné à la meilleure Newsletter de la toile, 'Chez Pol'."),
          ),
        ],
      )),
    );
  }
}

class nastiaHomePresentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: 20, right: 30),
                child: Wrap(
                  children: [
                    Container(
                      child: RichText(
                        text: TextSpan(children: [
                          redTitle2("NASTIA LA ROUGE "),
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
            padding: EdgeInsets.only(top: 2, left: 20, right: 30),
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
                  padding: EdgeInsets.only(top: 8, left: 20, right: 30),
                  child: byArticle("Anastasia Korotkova")),
            ],
          ),
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 8, left: 20, right: 30, bottom: 8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      publishDate("Publié le 26 Février 2023 à 10h20"),
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

class firstHomeArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 30),
            child: Wrap(
              children: [
                Container(
                  child: RichText(
                    text: TextSpan(children: [
                      redTitle('WANTED '),
                      blackTitle(
                          'DEUX ÉTUDIANTS POSSÉDANT DE FORTES COMPÉTENCES EN FLUTTER. RÉCOMPENSE: ALTERNANCE'),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 30),
            child: Wrap(
              children: [
                Container(
                  child: RichText(
                    text: TextSpan(children: [
                      sousTitre(
                          "Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...).")
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8, left: 20, right: 30),
                  child: byArticle("Anastasia et Johan")),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8, left: 20, right: 30, bottom: 8),
                      child: RichText(
                      text: TextSpan(
                          children: [
                              publishDate("Publié le 26 Février 2023 à 18h20"),
                            ],
                      ),),),],
          ),
              Row(
              children: [
              Image.asset(
                'img/85808-cherche-ancien-affiche-vectoriel.jpg', width: size.width, fit: BoxFit.cover,
              ),
        ]
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 20, right: 30),
            child: legendePictures('Go les cocos'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, left: 20, right: 30),
            child: paragraph(
                "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécie le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre."),
          )],
        ),
      ),
    );
  }
}
