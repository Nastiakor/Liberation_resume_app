import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var platform = Theme
        .of(context)
        .platform;
    print("size: $size");
    print("platform: $platform");
    double width = MediaQuery
        .of(context)
        .size
        .width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                            "DEUX DEVELOPPEURS EN RECHERCHE D'ALTERNANCE PRETS A REVOLUTIONNER L'APPLI DE LIBERATION"),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 7,
                        left: 4,
                      ),
                      child: paragraph(
                          "Fraichement issus du centre de formation d'Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux, seront de précieux alliés pour les projets tech de Libération. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...). Ils ont le bénéfice de leur grand âge, cette expérience qui permet d'être calme et concentré y compris dans des contextes stressants. Ils savent aussi se mettre au diapason de la dynamique collective."),),
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
                  flex: 3,
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
            Padding(padding: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex:2,
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
                            child: paragraph("Née en Union Soviétique qu'elle connaîtra près d'une décennie avant sa chute, elle a passé une adolescence agitée dans la toute neuve Russie. Elle a acquis une conscience politique très jeune grâce aux traductions du journal Libération opérées par le S.F.I.O (Syndicat Fédéral d'Iochkar-Ola) envoyés par des habitants de sa fantastique ville jumelle Française, Bourges. Délivrant ses messages philosophico-politiques grâce à l'art du Tag sur les murs de l'agglomération, elle a réalisé ses premiers sabotages de navires à l'âge de 6 ans sur les bords du Malaya Kokshaga. Soucieuse de défendre un monde plus juste et la liberté de la presse, elle apprend actuellement les rudiments du développement entre deux manifestations Parisiennes.")
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Padding(padding: EdgeInsets.only(left:5),
                    child: Container(
                      child: Image.asset(
                        'img/NASTIA.JPG',
                      ),
                    ),
                  )
                  )
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
                  flex: 3,
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
            Padding(padding: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex:2,
                    child: Wrap(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              redTitle2("JOJO LE BOX-TO-BOX "),
                              blackTitle2("POLYVALENT ET DETERMINE QUELQUE SOIT SON POSTE SUR LA GAUCHE DU TERRAIN"),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                              left: 2,
                            ),
                            child: paragraph("Aussi à l'aise à la récupération grâce à sa fougue, à la relance avec son énergie ou en meneur de jeu avec sa créativité et sa vision stratégique, son expérience de la gestion de projet, de la mobilisation citoyenne et du développement du pouvoir d'agir dans différents mouvements d'éducation populaire, lui permet d'avoir de nombreuses cartes de son jeu. Comme le prouve la photo, il sait être drôle parfois. Et aussi fièrement abonné à la meilleure Newsletter de la toile Chez Pol.")
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Padding(padding: EdgeInsets.only(left:5),
                    child: Container(
                      child: Image.asset(
                        'img/JOHAN.JPG',
                      ),
                    ),
                  )
                  )
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
                  flex: 3,
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
      style: TextStyle(color: Colors.black87, fontSize: 10));
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
                fontSize: 9),
          ),
        ),
      ),
    ),
  );
}

Expanded time(String time) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: 0),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "$time",
            style: TextStyle(color: Colors.black45, fontSize: 9),
          ),
        ),
      ),
    ),
  );
}

Expanded abonne() {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: 0),
      child: Container(
        child: RichText(
          text: TextSpan(
            text: "Abonné",
            style: TextStyle(color: Colors.amber, fontSize: 9),
          ),
        ),
      ),
    ),
  );
}
