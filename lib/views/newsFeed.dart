import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';
import 'package:cv_flutter_libe/Controllers/bottomNavigationBar.dart';

void main() => runApp(const newsFeed());

class newsFeed extends StatelessWidget {
  const newsFeed({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MynewsFeedWidget(),
    );
  }
}

class MynewsFeedWidget extends StatefulWidget {
  const MynewsFeedWidget({super.key});

  @override
  State<MynewsFeedWidget> createState() => MynewsFeedWidgetState();
}

class MynewsFeedWidgetState extends State<MynewsFeedWidget> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    var contextest = context;
    print("context: $contextest");
    print("platform: $platform");
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child:
        SingleChildScrollView(
              child: Column(
                children: [
                  MainArticle(
                    imagePath: "img/PhotoshopWanted.jpg",
                    title: "WANTED ",
                    titlethen:
                        "DEUX ÉTUDIANTS EN DEVELOPPEMENT MOBILE. RÉCOMPENSE: ALTERNANCE",
                    paragraphMainArticle:
                        "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération.",
                    themeMainArticle: "Chômage",
                    writtenBy: "Anastasia et Johan",
                    publishDateParam: "2023-03-06 10:13:00",
                    legendPicture:
                        "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
                    completeArticle:
                        "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécient le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...). \n\nAttachés à la liberté de la presse, l'un d'entre eux est abonné à Libération et fidèle de Chez Pol, ils sont grandement motivés pour intégrer votre équipe de développeuses et développeurs et contribué à améliorer vos applications et à grandir avec vous tout en apportant leurs qualités et expériences. ",
                  ),
                  MainArticle(
                    imagePath: "img/PhotoshopWanted.jpg",
                    title: "WANTED ",
                    titlethen:
                        "DEUX ÉTUDIANTS EN DEVELOPPEMENT MOBILE. RÉCOMPENSE: ALTERNANCE",
                    paragraphMainArticle:
                        "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération.",
                    themeMainArticle: "Chômage",
                    writtenBy: "Anastasia et Johan",
                    publishDateParam: "2023-03-06 10:13:00",
                    legendPicture:
                        "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
                    completeArticle:
                        "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécient le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...). \n\nAttachés à la liberté de la presse, l'un d'entre eux est abonné à Libération et fidèle de Chez Pol, ils sont grandement motivés pour intégrer votre équipe de développeuses et développeurs et contribué à améliorer vos applications et à grandir avec vous tout en apportant leurs qualités et expériences. ",
                  ),
                  MainArticle(
                    imagePath: "img/PhotoshopWanted.jpg",
                    title: "WANTED ",
                    titlethen:
                        "DEUX ÉTUDIANTS EN DEVELOPPEMENT MOBILE. RÉCOMPENSE: ALTERNANCE",
                    paragraphMainArticle:
                        "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération.",
                    themeMainArticle: "Chômage",
                    writtenBy: "Anastasia et Johan",
                    publishDateParam: "2023-03-06 10:13:00",
                    legendPicture:
                        "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
                    completeArticle:
                        "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécient le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...). \n\nAttachés à la liberté de la presse, l'un d'entre eux est abonné à Libération et fidèle de Chez Pol, ils sont grandement motivés pour intégrer votre équipe de développeuses et développeurs et contribué à améliorer vos applications et à grandir avec vous tout en apportant leurs qualités et expériences. ",
                  ),
                  MainArticle(
                    imagePath: "img/PhotoshopWanted.jpg",
                    title: "WANTED ",
                    titlethen:
                        "DEUX ÉTUDIANTS EN DEVELOPPEMENT MOBILE. RÉCOMPENSE: ALTERNANCE",
                    paragraphMainArticle:
                        "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération.",
                    themeMainArticle: "Chômage",
                    writtenBy: "Anastasia et Johan",
                    publishDateParam: "2023-03-06 10:13:00",
                    legendPicture:
                        "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
                    completeArticle:
                        "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécient le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...). \n\nAttachés à la liberté de la presse, l'un d'entre eux est abonné à Libération et fidèle de Chez Pol, ils sont grandement motivés pour intégrer votre équipe de développeuses et développeurs et contribué à améliorer vos applications et à grandir avec vous tout en apportant leurs qualités et expériences. ",
                  )
                ],
              ),
            ),
        ),
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: MyBottomHomeNavigationBar(),

    );
  }
}
