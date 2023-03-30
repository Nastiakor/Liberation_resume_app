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
                "À travers cette application portfolio, dont le design s'inspire volontairement du journal Libération, vous pourrez retrouver nos formations, expériences professionnelles et projets Tech respectifs qui valorisent nos compétences et savoir-être.",
            themeMainArticle: "Alternance",
            writtenBy: "Anastasia et Johan",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture:
                "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
            completeArticle:
                "Vous pourrez également en apprendre un peu plus sur nos personnalités et lire le fil d'actualité de Libération (chargé grâce à l'action 'man-in-the-middle' et au token de l'un d'entre nous). Vous y trouverez également les 7 articles les plus consultés du New-York Times récupérés via leur API et affichés avec la charte graphique de Libération.\nNous sommes des étudiants en reconversion professionnelle engagés dans un processus d'apprentissage de près de deux ans, qui se décompose de la manière suivante :\n\n• Un premier module théorique de 9 mois sur site\n•	Un second module d'un an en alternance.\n\nTous les deux intéressés par le développement d'applications mobiles, nous avons décidé d'unir nos forces et une grande partie de notre temps afin de découvrir puis d'apprendre ensemble les bases de cet univers. Ce choix a également été dicté par le fait que l'école ne propose pas spécifiquement de cours sur le mobile hormis le dernier mois de formation, et aussi par le fait que nous sommes dans un cadre pédagogique avec des espaces de liberté. Travailler ensemble en peer-learning a été stimulant et a accéléré notre apprentissage. De plus, nous avons pu consolider notre capacité de travail en équipe.\nAprès réflexion et étude de marché, nous avons opté pour le SDK cross-plateforme Flutter et son langage Dart. Après une phase de découverte, nous nous sommes mis en mode projet et avons produit cette application pour rendre concrète cette montée en compétences. Nous avons créé ce portfolio commun, une application mobile en Flutter, et nous espérons qu'elle attirera votre attention. Nous pouvons également nous adapter à vos besoins et élargir nos compétences à d'autres contraintes techniques (Swift, Kotlin, etc.).\nPrécision importante pour faciliter votre lecture :\n\n•	Si le titre commence en vert : il concerne Anastasia Korotkova\n•	Si le titre commence en rouge : il concerne Johan Anquetil\n•	Si le titre est en violet : il concerne tous les deux.\n\nNous avons fait le choix de ne produire qu'une seule application pour nos deux candidatures et non pas deux individuelles, car nous pensons que si l'un de nos deux profils vous intéresse, vous aurez plus facilement la possibilité de choisir, et si nos deux profils vous conviennent et que vous avez la capacité de nous accueillir ensemble, nous serions ravis de vous faire bénéficier de nos compétences, qui sont dopées par l'osmose que notre relation de travail a générée et qui s'est confirmée au fil de ces semaines de collaboration.",
          ),
          SecondaryArticle(
            imagePath: "img/NASTIA.JPG",
            title: "ANASTASIA KOROTKOVA ",
            titlethen: "VERS UNE NOUVELLE PASSION",
            paragraphMainArticle:
                "Actuellement en reconversion professionnelle dans le domaine du développement d'applications et de logiciels, je suis, depuis octobre 2022, une formation à Ada Tech School qui me permet d'acquérir les compétences nécessaires pour créer des applications performantes et intuitives.",
            themeMainArticle: "Présentation",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture:
                "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
            completeArticle:
                "Je suis particulièrement intéressée par le mobile, et notamment, par Flutter. Au sein de mon école, j'ai travaillé sur plusieurs projets intéressants, notamment une application mobile en Flutter, un jeu vidéo sur Pico-8 en Lua, un site Internet basé sur l'API 'Que faire à Paris ?' en JavaScript, ainsi qu'une extension de navigateur Chrome en Javascript et MongoDB.\nAvant de me lancer dans le développement d'applications, j'ai travaillé dans le domaine de l'hôtellerie en tant que réceptionniste, ainsi qu'en tant qu’assistante de direction générale. J'ai également une formation en langues étrangères et en sciences du langage.Je suis passionnée de nouvelles technologies, de science, de musique , de théâtre, de cinéma et de littérature. J'aime aussi voyager et découvrir de nouvelles cultures. Je suis très motivée pour continuer à apprendre et à évoluer dans le domaine du développement d'applications, et je suis convaincue que mes compétences et mon expérience précédente seront des atouts pour réussir dans ce domaine.",
          ),
          SecondaryArticle(
            imagePath: "img/JOHAN.JPG",
            title: "JOHAN ANQUETIL ",
            titlethen: "DE LA GESTION DE PROJET AU CODE",
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
        ],
      ),
    );
  }
}
