import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/main.dart';
import 'package:cv_flutter_libe/functions.dart';

void _onItemTapped(int index) {}

class jojoHomePresentation extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<jojoHomePresentation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    final DateTime articlePublishingDate = DateTime(2023, 02, 27);

// Define the function to calculate the days until the birthday
    String daysUntilArticle() {
      return calculatePublishingDate(articlePublishingDate);
    }

    return Scaffold(
      appBar: MyAppBar(),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.close, size: 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border, size: 25),
            label: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            if (_currentIndex == 0) {
              Navigator.of(context).pop();
            }
          });
        },
      ),
    );
  }
}

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
                          blackTitle("FROM MARIS WITH LOVE")
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

class firstHomeArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthMax = size.width;
    var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
          child: megaGigaFunction(
              "WANTED ",
              'DEUX ÉTUDIANTS POSSÉDANT DE FORTES COMPÉTENCES EN FLUTTER. RÉCOMPENSE: ALTERNANCE',
              "Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...).",
              "Anastasia et Johan",
              "2023-02-10",
              "img/85808-cherche-ancien-affiche-vectoriel.jpg",
              "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
              "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécie le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre.",
              "$widthMax"),),
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
