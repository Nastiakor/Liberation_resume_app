import 'package:cv_flutter_libe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/functions.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
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
          SecondaryArticle(
            imagePath: "img/NASTIA.JPG",
            title: "ANASTASIA KOROTKOVA ",
            titlethen:
                "FROM RUSSIA WITH LOVE",
            paragraphMainArticle:
                "Pensionnaires du centre de formation de l'équipe féministe Ada Tech School dans le 10e arrondissement de Paris (si t'es pas le numéro 10 à Paname...), les plus si jeunes développeurs en puissance, 75 ans à eux deux quand même, seront de précieux alliés pour les projets tech de Libération.",
            themeMainArticle: "Chômage",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture:
                "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
            completeArticle:
                "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécie le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre. Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...).",
          ),
          SecondaryArticle(imagePath: "img/JOHAN.JPG",
            title: "JOHAN ANQUETIL ",
            titlethen:
            "DE LA GESTION DE PROJET AU CODE",
            paragraphMainArticle:
            "Créatif, curieux, motivé et profondément collectif, je suis en reconversion professionnel dans le domaine du développement après avoir oeuvré 10 ans dans le secteur associatif.",
            themeMainArticle: "Présentation",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture:
            "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
            completeArticle:
            "Passionné d'informatique et de technologies depuis l'enfance, je me souviens avoir réalisé un petit programme en Basic sur un Vtech Genius 2000, j'ai longuement hésité à me diriger dans ce domaine après l'obtention de mon bac Economique et Social. J'ai finalement choisi une autre voie qui m'a amené à travailler pendant 10 ans au sein d'une association de défense des droits des personnes en situation de handicap. Au sein d'APF France handicap, j'ai occupé trois postes durant lesquels j'ai pu renforcer mes compétences de gestion de projets, de management d'un réseau de salariés et bénévoles, d'expertise sur le soutien opérationnelle et stratégique de collectifs, de développement du pouvoir d'agir des acteurs, d'ingénierie de formation et de leur animation... \n\nCes dix années m'ont forgé sur le plan personnel et de ma posture professionnelle. Etre au service des dynamiques crées par les personnes concernées ou les aider à réfléchir, à développer leur esprit critique et fédérer un groupe d'individus autour d'objectifs communns nécessitent des qualités d'écoute, d'empathie, de calme, d'être positif en permanence afin de donner confiance, de médiation parfois, et de rigueur. Je sais alterner des postures de facilitation, de cheville ouvrière ou de meneur.\n\n Bien que passionné par mon emploi, une forte envied de me remettre en question et de me lancer dans le code a ressurgi ces 5 dernières années, il m'a fallu du temps pour murir ce projet et trouver des financements.\n\nEn formation depuis le mois d'Octobre 2022 à plein temps, j'ai été confronté aux différents langages (JavaScript, C#, Dart, PHP, SQL) dans le cadre de différents projets que vous retrouverez sur la page suivante. \n\nPour conclure, je recherche une alternance dans le développement Mobile, j'apprécie l'objet en tant que tel, son utilité et sa facilité d'utilisation pour la personne, rendant l'information rapidement accessible. Je m'initie au Dart et à Flutter, que j'apprécie, depuis trois mois chaque vendredi et quelques jours par semaine dès que possible. Je suis adaptable à d'autres technologies et prêt à apprendre Swift ou Kotlin selon vos besoins.",
          ),
        ]
      ),
    );
  }
}
