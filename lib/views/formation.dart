import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';

class Formations extends StatelessWidget {
  const Formations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
          children: [
            MainArticle(
              imagePath: "img/Formations/AdaTechschool.webp",
              title: "2022 - 2023 : ADA TECH SCHOOL ",
              titlethen:
              "ECOLE FEMINISTE BASEE SUR UNE PEDAGOGIE INNOVANTE ET FORMANT DES DÉVELOPPEUSES / DÉVELOPPEURS D'APPLICATIONS ET LOGICIELS FULL STACK",
              paragraphMainArticle:
              "Tous les deux étudiants au sein de la promotion Dorothy Vauhan d'Ada Tech School, cette formation nous prépare en deux ans aux métiers du développement informatique (Mobile, back-end et front-end) grâce à la pédagogie Montessori et à des projets collectifs.",
              themeMainArticle: "Reconversion",
              writtenBy: "Johan et Anastasia",
              publishDateParam: "2023-03-07 10:13:00",
              legendPicture:
              "Promotion Dorothy Vaughan - Paris 10e",
              completeArticle:
              "Ada Tech School, jeune école créée en 2019 lancée à Paris puis à Nantes, est atypique. Elle ne forme pas seulement des développeuses et des développeurs par la transmission de savoirs techniques. Son projet pédagogique porte des valeurs fortes : défense de la place des femmes dans les métiers de la tech, valorisation des soft-skills et du travail en équipe dans des logiques de pair-learning.\n\nSelon le rapport DESI 2020, seulement 18 % des spécialistes des TIC en Europe sont des femmes. Pour contrer cette situation, alors que les métiers de la Tech conditionnent nos vies de plus en plus, il n'est pas envisageables que les outils du quotidien soient pensée et conçus par des hommes. De plus, les métiers de la Tech favorisent l'émancipation ! Ada Tech School se donne les moyens de ses ambitions : Une majorité d'apprenants à l'école sont des apprenantes, des sensibilisations sur cet enjeu sont organisées au sein de l'école, d'universités, de salons et d'entreprises afin de faire bouger les lignes.  \n\nLa méthode a été inspirée par la célèbre pédagogue italienne Maria Montessori. Pas de cours magistraux, pas d'examen, une liberté totale. Pour ce faire, l'apprentissage se réalise soit grâce à des projets concrets et variés de groupe de 3 -4 personnes sur des périodes de deux semaines, soit lors des semaines dites 'arbres', où, en binôme, nous explorons des concepts théoriques. Le rythme est basée sur des itérations de quinze jours, 2 semaines de projets collectifs, 2 semaines d'apprentissages théoriques. \nLe travail en équipe permanent facilite le développement de 'soft-skills', mettre en place des daily et des reviews, organiser la coopération, savoir découper des tâches ou oeuvrer en pair-programming, pouvoir adapter son rythme à ses collègues et à être à l'écoute des attentes, besoins et rythmes de chacun pour mieux s'entraider. \n\nDeux encadrants professionnels se relaient quotidiennement pour nous accompagner, nous soutenir, et faire part de leurs expériences dans un cadre positif et bienveillant. \n\nChez Ada, nous n'apprenons des langages en particulier, nous apprenons la programmation en général, ses paradigmes, pour nous rendre adaptables à différentes technologies. Nous passons d'un langage à un autre régulièrement. \n\nVous pourrez retrouver nos projets dans l'onglet dédiés qui ont été réalisés en : \n\n - PHP \n - JavaScript avec ses Frameworks \n - LUA \n - Dart (Flutter) \n - MySQL   ",
            ),
            SecondaryArticle(
              imagePath: "",
              title: "",
              titlethen:
              "",
              paragraphMainArticle:
              "",
              themeMainArticle: "",
              writtenBy: "",
              publishDateParam: "2023-03-06 10:13:00",
              legendPicture:
              "",
              completeArticle:
              "",
            ),
          ]
      ),
    );
  }
}
