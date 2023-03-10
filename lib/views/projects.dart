import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
          children: [
            MainArticle(
              imagePath: "img/Projets/Studio_Ghibli.webp",
              title: "APPREHENDER L'APPEL D'UNE API : ",
              titlethen:
              "PUBLICATION D'UN STUDIO GHIBLI",
              paragraphMainArticle:
              "Ce projet avait pour objectif de développer une application web qui permette de visualiser des données de façon dynamique.",
              themeMainArticle: "API",
              writtenBy: "Johan Anquetil",
              publishDateParam: "2023-03-06 10:13:00",
              legendPicture:
              "Une page du site sur",
              completeArticle:
              "Ce projet a été réalisé avec deux camarades de l'école 'Ada Tech School' dans le cadre des projets collectifs. Ce fut le deuxième projet, lors de notre deuxième mois de formation. Nous avons proposé aux fans du studio Ghibli d'avoir accès à la filmographie et à différents détails et informations. L'objectif pédagogique était de nous familiariser avec les API.\n\nCe projet nous a permis de développer notre connaissance de JavaScript, de découvrir AnimeJS, d'appeler une librairie, de créer du CSS et HTML. Très peu de données sont écrites en dur dans le code, la plupart des éléments proviennent de l'API.",
            ),
            SecondaryArticle(
              imagePath: "img/Projets/Unity.png",
              title: "DEVELOPPEMENT D'UN MINI JEU-VIDEO EN 2D ",
              titlethen:
              "SUR UNITY EN C#",
              paragraphMainArticle:
              "Incarnez un célèbre entrepreneur qui a décidé de partir à la conquête de Mars afin de fuir l'inhospitalière planète terre polluée et devenue irrespirable. Seul problème, en contruisant votre fusée, vous participez à la destuction de la planète et vos salariés ne sont pas toujours très dociles.",
              themeMainArticle: "Unity",
              writtenBy: "Johan Anquetil",
              publishDateParam: "2023-03-06 15:09:00",
              legendPicture:
              "Jeu réalisé grâce au FrameWork Unity",
              completeArticle:
              "Avec une collègue de ma promotion, nous nous sommes lancés le défi de contruire un jeu, en parallèle du cursus d'ADA Tech School, nécessitant l'appréhension de concepts de base de C#. Le jeu se veut simple avec des graphismes en 2D réalisés par nos soins, quelques questions avec des réponses à choix multiples, qui impactent deux barres de vie et... à la fin soit vous perdez car la terre a explosé avec vous dessus... soit vous arrivez à vous échapper.\n\n Le jeu est en cours d'édition.",
            ),
            SecondaryArticle(
              imagePath: "img/Projets/resoc.webp",
              title: "RESEAU SOCIAL EN SQL ",
              titlethen:
              "AVEC PHPMYADMIN",
              paragraphMainArticle:
              "Quatrième projet à Ada Tech School, avec un groupe de quatre personnes, nous avons pu nous entraîner à créer et faire communiquer une base de données... ainsi que découvrir le PHP",
              themeMainArticle: "PHP/MYSQL",
              writtenBy: "Johan Anquetil",
              publishDateParam: "2023-03-06 15:09:00",
              legendPicture:
              "Illustration du site designé en CSS natif",
              completeArticle:
              "Ce réseau social, réalisé en 7 jours, fut une étape importante dans notre formation car nous avons été confronté pour la première fois à une base de données SQL (avec MySQL). Nous avons réussi à créer une page d'inscription et se connection, créer les fonctionnalités d'abonnements à des ami.e.s, laisser des messages sur son mur, aimer un message ou annuler son 'j'aime', rechercher des mots-clés.",
            ),
            SecondaryArticle(
              imagePath: "img/Projets/Chrome.webp",
              title: "EXTENSION DE NAVIGATEUR GOOGLE : ",
              titlethen:
              "EN JAVASCRIPT ET EN FAISANT APPEL A UNE API",
              paragraphMainArticle:
              "Troisième projet de groupe, conçu avec deux camarades en 7 jours également, cette extension Google vous donne le temps passé par nom de domaine.",
              themeMainArticle: "JavaScript",
              writtenBy: "Johan Anquetil",
              publishDateParam: "2023-03-06 15:09:00",
              legendPicture:
              "Google",
              completeArticle:
              "Combien de temps suis-je resté aujourd'hui sur le site de Libération ? et sur Instagram ? Voilà en quelques mots la présentation de notre extension. Réalisée en JavaScript, elle calcule en heures, minutes et secondes, par jour, le temps que vous êtes resté.e sur un onglet actif. Le temps est calculé grâce à la méthode setInterval puis incrémenté.",
            ),
            SecondaryArticle(
              imagePath: "img/Projets/Norton_Kong.webp",
              title: "CREATION D'UN NIVEAU D'UN JEU-VIDEO ",
              titlethen:
              "EN LUA GRACE A LA PLATEFORME PICO-8",
              paragraphMainArticle:
              "Premier projet réalisé quelques semaines après notre arrivée avec deux autres camarades, il est inspiré de Donkey Kong, un héros qui part du bas de l'écran pour réussir à atteindre un objectif situé... à l'opposé.",
              themeMainArticle: "LUA",
              writtenBy: "Johan Anquetil",
              publishDateParam: "2023-03-06 15:09:00",
              legendPicture:
              "Image de notre jeu",
              completeArticle:
              "Les défis posés par ce premier projet était nombreux, comprendre le LUA (dérivé du langage C), apprendre à travailler en équipe, à découper les tâches...  et techniques : designer le jeu, gérer les déplacements, la gravité, créer des ennemis qui se déplacent et réapparaissent, gérer un système de tir avec des balles qui tuent les ennemis, des collisions et de la vie...",
            ),
          ]
      ),
    );
  }
}
