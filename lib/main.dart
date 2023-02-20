import 'package:cv_flutter_libe/icons.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Accueil',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("size: $size");
    print("platform: $platform");
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Libé'),
            Container(
              //  margin: const EdgeInsets.only(right: 75),
              child: Image.asset(
                'img/1200px-Libération.svg.png',
                width: 100,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
            Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: Wrap(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        redTitle("WANTED "),
                        blackTitle(
                            "DEUX ALTERNANTS DEVELOPPEUSE ET DEVELOPPEUR PRETS A REVOLUTIONNER LES APPLIS DE LIBE"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 7,
                      left: 4,
                    ),
                    child: paragraph(
                        "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...). Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécie le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre."),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                theme("Chômage"),
                time("Il y a 5 minutes"),
                abonne(),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.bookmark_border)],
                    ),
                  ),
                ),
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
                        RichText(
                          text: TextSpan(
                            children: [
                              redTitle2("NASTIA LA ROUGE "),
                              blackTitle2("FROM MARIS WITH RABIES"),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              left: 2,
                            ),
                            child: paragraph(
                                "Née en Union Soviétique qu'elle connaîtra près d'une décennie avant sa chute, elle a passé une adolescence agitée dans la toute neuve Russie vendue au capitalisme par Gorbatchev. Elle a acquis une conscience politique très jeune grâce aux traductions du journal Libération opérées par le S.F.I.O (Syndicat Fédéral d'Iochkar-Ola) envoyés par la section communiste de Bourges avec qui elle n'est pas encore jumelée. Délivrant ses messages philosophico-politiques grâce à l'art du Tag sur les murs de l'agglomération, avec notamment un bien senti 'Mektoub mes couilles', elle a réalisé ses premiers sabotages de navires à l'âge de 6 ans sur les bords du Malaya Kokshaga. Soucieuse de défendre un monde plus juste et la liberté de la presse, elle apprend actuellement les rudiments du développement entre deux manifestations Parisiennes avec en ligne de mire l'intégation à l'équipe de dev de Libé qui doit être formidable.")),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      child: Image.asset(
                        'img/NASTIA.JPG',
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                theme("Candidature"),
                time("Il y a 25 minutes"),
                abonne(),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.bookmark_border)],
                    ),
                  ),
                ),
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
                        RichText(
                          text: TextSpan(
                            children: [
                              redTitle2("JOJO LE BOX-TO-BOX "),
                              blackTitle2(
                                  "POLYVALENT ET DETERMINE QUELQUE SOIT SON POSTE SUR LA GAUCHE DU TERRAIN"),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              left: 2,
                            ),
                            child: paragraph(
                                "Aussi à l'aise à la récupération grâce à sa fougue, à la relance avec son énergie ou en meneur de jeu avec sa créativité et sa vision stratégique, ses expériences de la gestion de projet, de la mobilisation citoyenne et du développement du pouvoir d'agir dans différents mouvements d'éducation populaire, lui permettent d'avoir de nombreuses cartes de son jeu. Convaincu que la démocratie devrait être plus participative et que l'engagement citoyen est conditionné à être éclairé, il souhaite participer aux projets Tech de Libé qui est fondamental selon lui pour conscientiser les citoyens sur les grands sujets de société et favoriser la compréhension des enjeux contemporains. Pas fan de la propriété, ni de l'héritage, il se rêve en Che Guevarra (les purges en moins) sur son vélib certains soirs, parcourant la banlieue parisienne. Un peu bobo, un peu beauf, il squatte Bauer et ne jure que par l'étoile rouge. Un peu austère, il ne boit pas d'alcool, ne fume pas, ne mange pas de cadavres et est contre l'avion. Mais comme le prouve la photo, il sait être drôle parfois.\nEst aussi fièrement abonné à la meilleure Newsletter de la toile, 'Chez Pol'.")),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      child: Image.asset(
                        'img/JOHAN.JPG',
                      ),
                    ),
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
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.bookmark_border)],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.red),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.libelogo, size:20),
            label: '           A la une',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.passage_du_temps, size:35),
            label: 'Fil info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, size: 30),
            label: 'Le journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Mon Libé',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_open_rounded, size: 30,),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

TextSpan redTitle(String title) {
  return TextSpan(
      text: "$title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20));
}

TextSpan blackTitle(String title) {
  return TextSpan(
      text: "$title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20));
}

Text paragraph(String paragraph) {
  return Text("$paragraph",
      style: TextStyle(color: Colors.black87, fontSize: 15));
}

TextSpan redTitle2(String title) {
  return TextSpan(
      text: "$title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.red, fontSize: 15));
}

TextSpan blackTitle2(String title) {
  return TextSpan(
      text: "$title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15));
}

Text paragraph2(String paragraph) {
  return Text("$paragraph",
      style: TextStyle(color: Colors.black87, fontSize: 8));
}

Expanded theme(String theme) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "$theme",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 13),
          ),
        ),
      ),
    ),
  );
}

Expanded time(String time) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(right: 0),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "$time",
            style: TextStyle(color: Colors.black45, fontSize: 13),
          ),
        ),
      ),
    ),
  );
}

Expanded abonne() {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "Abonné",
            style: TextStyle(color: Colors.amber, fontSize: 13),
          ),
        ),
      ),
    ),
  );
}
