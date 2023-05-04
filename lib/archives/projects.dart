import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/view_articles_main_full_secondary.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainArticle(
            imagePath: "img/Projets/retrovibes.png",
            titleHeadline: "SITE DE E-COMMERCE DE MEUBLES : ",
            titleOverline: "RETROVIBES",
            paragraphMainArticle:
                "En collaboration avec un groupe de 10 personnes, nous avons créé un site de vente de meubles avec un back-end créé en Laravel et un front en React.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture: "Validation du panier",
            completeArticle:
                "Voici le pitch qui fixe le cadre de ce projet sur lequel notre groupe s'est accordé : Lauréline Fleury a lancé son entreprise “Anciens meubles pour une nouvelle vie”, de vente de meubles de seconde main. Pour gagner en visibilité, elle a besoin d’avoir un site internet pour afficher ses produits. En plus, cela lui permettra de gérer son stock. Son besoin est donc le suivant : J’ai besoin d’avoir une page principale qui regroupera les meubles en vente en ce moment. Pour l’affichage de chaque meuble, je souhaite un encart dans lequel on pourra retrouver une photo, le type de meuble, le prix et un bouton pour l’acheter. Chaque encart sera cliquable pour permettre d’accéder au détail du produit. Sur cette nouvelle page, on retrouvera une série de photos du meuble et toutes les informations nécessaires, c’est-à-dire, le type, le prix, les dimensions, les couleurs, les matières et bien sûr un bouton pour acheter. Pour ce qui est de l’administration, je souhaite une page de connexion. Lorsque je suis connectée je dois pouvoir accéder à une page de gestion des produits. Sur celle-ci je veux pouvoir avoir la liste de mes meubles. Je souhaite pouvoir modifier les informations de mes produits en ayant un bouton depuis ma liste. Je dois pouvoir également les supprimer s’ils ont été vendus en magasin.",
            linkRetroVibes: "retrovibes.herokuapp.com/home",
          ),
          MainArticle(
            imagePath: "img/Projets/Pico8_2.png",
            titleHeadline: "CREATION D'UN JEU RETRO L'ILE AUX TRESORS",
            titleOverline: " EN LUA GRACE A LA PLATEFORME PICO-8",
            paragraphMainArticle:
                "Pico-8 est une console imaginaire qui permet de créer, partager, et jouer à des jeux miniatures qui évoquent avec nostalgie les débuts du jeu vidéo grand public.",
            themeMainArticle: "Anastasia",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-08 16:10:00",
            legendPicture: "",
            completeArticle:
                "- Durée: 2 semaines\n- Moteur: Pico-8\n- Langage : Lua\n\nLe tout premier projet réalisé au sein d'Ada Tech School. Notre groupe composé de 3 personnes travaillait sur un jeu d'aventure où un pirate doit trouver 3 clés sur une île déserte afin de pouvoir ouvrir un coffre aux trésors.",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/Unity2.png",
            titleHeadline: "DEVELOPPEMENT D'UN MINI JEU-VIDEO EN 2D ",
            titleOverline: "SUR UNITY EN C#",
            paragraphMainArticle:
                "Incarnez un célèbre entrepreneur qui a décidé de partir à la conquête de Mars afin de fuir l'inhospitalière planète terre polluée et devenue irrespirable. Seul problème, en contruisant votre fusée, vous participez à la destuction de la planète et vos salariés ne sont pas toujours très dociles.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 15:09:00",
            legendPicture: "Jeu réalisé grâce au FrameWork Unity",
            completeArticle:
                "Avec une collègue de ma promotion, nous nous sommes lancés le défi de contruire un jeu, en parallèle du cursus d'Ada Tech School, nécessitant l'appréhension de concepts de base de C#. Le jeu se veut simple avec des graphismes en 2D réalisés par nos soins, quelques questions avec des réponses à choix multiples, qui impactent deux barres de vie et... à la fin soit vous perdez car la terre a explosé avec vous dessus... soit vous arrivez à vous échapper.\n\n Le jeu est en cours d'édition.",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/Dataviz.png",
            titleHeadline: "DATAVIZ & API",
            titleOverline: " CREATION D'UNE PAGE WEB SPECTACLES A PARIS",
            paragraphMainArticle: "APPEL D'UNE API",
            themeMainArticle: "Anastasia",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-08 16:40:00",
            legendPicture: "",
            completeArticle:
                "- Durée: 2 semaines\n- Langages : JavaScript, HTML, CSS\n\nCe projet réalisé avec 2 autres camarades de l'école, nous a permis de découvrir comment effectuer des appels d'API, d'appliquer l'asynchrone, nous familiariser avec des bibliothèques de JavaScript, e.g. jQuery, de créer un repo commun sur Github ",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/Chrome2.png",
            titleHeadline: "EXTENSION DE NAVIGATEUR GOOGLE CHROME : ",
            titleOverline: "EN JAVASCRIPT ET EN FAISANT APPEL A UNE API",
            paragraphMainArticle:
                "Troisième projet de groupe, conçu avec deux camarades en 7 jours également, cette extension Google Chrome vous donne le temps passé par nom de domaine.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 15:09:00",
            legendPicture: "Google",
            completeArticle:
                "Combien de temps suis-je resté aujourd'hui sur le site de Libération ? et sur Instagram ? Voilà en quelques mots la présentation de notre extension. Réalisée en JavaScript, elle calcule en heures, minutes et secondes, par jour, le temps que vous êtes resté.e sur un onglet actif. Le temps est calculé grâce à la méthode setInterval puis incrémenté.",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/My_mood_2.png",
            titleHeadline: "EXTENSION DE NAVIGATEUR",
            titleOverline: " JAVASCRIPT ET MONGO DB",
            paragraphMainArticle: "",
            themeMainArticle: "Anastasia",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-08 16:40:00",
            legendPicture: "",
            completeArticle:
                "- Durée: 2 semaines\n- Langage : JavaScript\n- Gestion de base de données: MongoDB\n\nCe projet avait pour but de créer une extension de navigateur Chrome qui permet d'enregistrer nos émotions tout au long de la journée afin de pouvoir les analyser par la suite. Nous avons créé une base de données contenant 6 émotions, ainsi que les profils d'utilisateurs ayant créé un compte",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/Norton_Kong.png",
            titleHeadline: "CREATION D'UN NIVEAU D'UN JEU-VIDEO ",
            titleOverline: "EN LUA GRACE A LA PLATEFORME PICO-8",
            paragraphMainArticle:
                "Premier projet réalisé quelques semaines après notre arrivée avec deux autres camarades, il est inspiré de Donkey Kong, un héros qui part du bas de l'écran pour réussir à atteindre un objectif situé... à l'opposé.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 15:09:00",
            legendPicture: "Image de notre jeu",
            completeArticle:
                "Les défis posés par ce premier projet était nombreux: comprendre le LUA (dérivé du langage C), designer le jeu, gérer les déplacements, la gravité, créer des ennemis qui se déplacent et réapparaissent, gérer un système de tirs avec des balles qui tuent les ennemis, des collisions et de la vie.",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/PHP-logo.png",
            titleHeadline: "RESEAU SOCIAL",
            titleOverline: " SQL ET PHPMYADMIN",
            paragraphMainArticle: "",
            themeMainArticle: "Anastasia",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-08 17:10:00",
            legendPicture: "",
            completeArticle:
                "- Durée: 2 semaines\n- Langage : PHP\n\nObjectifs:\n\n- Faire un site web dynamique qui construit les pages HTML à la demande grâce à une base de données.\n- Avoir un premier aperçu de la conception web, de la conception base de données et des problématiques d'un projet multi-langagues.\n\nCe projet réalisé avec 2 autres apprenants d'Ada Tech School, mélangeait 3 languages (PHP, HTML, MySQL). Nous avons décidé d'appliquer l'architecture MVC pour réfactoriser le code et le rendre plus professionnel.",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/Réseau_PHP_2.jpg",
            titleHeadline: "RESEAU SOCIAL EN SQL ",
            titleOverline: "AVEC PHPMYADMIN",
            paragraphMainArticle:
                "Quatrième projet à Ada Tech School, avec un groupe de quatre personnes, nous avons pu nous entraîner à créer et faire communiquer une base de données ainsi que découvrir le PHP",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 15:09:00",
            legendPicture: "Illustration du site designé en CSS natif",
            completeArticle:
                "Ce réseau social, réalisé en 7 jours, fut une étape importante dans notre formation car nous avons été confrontés pour la première fois à une base de données SQL (avec MySQL). Nous avons créé une page d'inscription et de connection, les fonctionnalités d'abonnements à des ami.e.s, la possibilité de laisser des messages sur son mur, aimer un message ou annuler son 'j'aime', rechercher des mots-clés.",
          ),
          SecondaryArticle(
            imagePath: "img/Projets/Studio_Ghibli_2.jpg",
            titleHeadline: "APPREHENDER L'APPEL D'UNE API : ",
            titleOverline: "PUBLICATION D'UN STUDIO GHIBLI",
            paragraphMainArticle:
                "Ce projet avait pour objectif de développer une application web qui permet de visualiser des données de façon dynamique.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture: "Une page du site sur",
            completeArticle:
                "Ce projet a été réalisé avec deux camarades de l'école 'Ada Tech School' dans le cadre des projets collectifs. Ce fut le deuxième projet, lors de notre deuxième mois de formation. Nous avons proposé aux fans du studio Ghibli d'avoir accès à la filmographie et à différents détails et informations. L'objectif pédagogique était de nous familiariser avec les API.\n\nCe projet nous a permis de développer notre connaissance de JavaScript, de découvrir AnimeJS, d'appeler une librairie, de créer du CSS et HTML. Très peu de données sont écrites en dur dans le code, la plupart des éléments proviennent de l'API.",
            linkGhibli: "test",
          ),
        ],
      ),
    );
  }
}
