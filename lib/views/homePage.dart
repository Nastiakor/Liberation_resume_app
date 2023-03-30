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
            imagePath: "img/Wanted_photoshop.jpg",
            title: "WANTED ",
            titlethen:
                "DEUX ÉTUDIANTS EN DEVELOPPEMENT MOBILE. RÉCOMPENSE: ALTERNANCE",
            paragraphMainArticle:
                "En formation de développeuse et développeur d'applications et logiciel au sein d'Ada Tech School depuis le mois d'Octobre 2022, nous sommes à la recherche d'une alternance dans le développement mobile à partir du mois de Juillet 2023 pour une durée d'un an.",
            themeMainArticle: "Alternance",
            writtenBy: "Anastasia et Johan",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture:
                "En recherche d'alternance pour la période de juillet 2023 à Juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
            completeArticle:
                "À travers cette application portfolio, dont le design s'inspire volontairement du journal Libération, vous pourrez retrouver nos formations, expériences professionnelles et projets Tech respectifs qui valorisent nos compétences et savoir-être. Vous pourrez également en apprendre un peu plus sur nos personnalités et lire le fil d'actualité de Libération (chargé grâce à l'action 'man-in-the-middle' et au token de l'un d'entre nous). Vous y trouverez également les 7 articles les plus consultés du New-York Times récupérés via leur API et affichés avec la charte graphique de Libération.\nNous sommes des étudiants en reconversion professionnelle engagés dans un processus d'apprentissage de près de deux ans, qui se décompose de la manière suivante :\n\n• Un premier module théorique de 9 mois sur site\n•	Un second module d'un an en alternance.\n\nTous les deux intéressés par le développement d'applications mobiles, nous avons décidé d'unir nos forces et une grande partie de notre temps afin de découvrir puis d'apprendre ensemble les bases de cet univers. Ce choix a également été dicté par le fait que l'école ne propose pas spécifiquement de cours sur le mobile hormis le dernier mois de formation, et aussi par le fait que nous sommes dans un cadre pédagogique avec des espaces de liberté. Travailler ensemble en peer-learning a été stimulant et a accéléré notre apprentissage. De plus, nous avons pu consolider notre capacité de travail en équipe.\nAprès réflexion et étude de marché, nous avons opté pour le SDK cross-plateforme Flutter et son langage Dart. Après une phase de découverte, nous nous sommes mis en mode projet et avons produit cette application pour rendre concrète cette montée en compétences. Nous avons créé ce portfolio commun, une application mobile en Flutter, et nous espérons qu'elle attirera votre attention. Nous pouvons également nous adapter à vos besoins et élargir nos compétences à d'autres contraintes techniques (Swift, Kotlin, etc.).\nPrécision importante pour faciliter votre lecture :\n\n•	Si le titre commence en vert : il concerne Anastasia Korotkova\n•	Si le titre commence en rouge : il concerne Johan Anquetil\n•	Si le titre est en violet : il concerne tous les deux.\n\nNous avons fait le choix de ne produire qu'une seule application pour nos deux candidatures et non pas deux individuelles, car nous pensons que si l'un de nos deux profils vous intéresse, vous aurez plus facilement la possibilité de choisir, et si nos deux profils vous conviennent et que vous avez la capacité de nous accueillir ensemble, nous serions ravis de vous faire bénéficier de nos compétences, qui sont dopées par l'osmose que notre relation de travail a générée et qui s'est confirmée au fil de ces semaines de collaboration.",
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
            "Créatif et curieux, je suis actuellement en reconversion professionnelle dans le domaine du développement mobile, convaincu de sa capacité à transformer nos sociétés.",
            themeMainArticle: "Présentation",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture:
                "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
            completeArticle:
            "Actuellement en formation de «Développeur FullStack» à Ada Tech School depuis Octobre 2022 dans le cadre d’une reconversion professionnelle, je souhaite poursuivre mon apprentissage une année supplémentaire en alternance afin de me spécialiser dans le développement mobile.\n\nPassionné d'informatique et de technologies depuis l'enfance, je me souviens d’ailleurs d’avoir eu une approche du Basic sur un Vtech Genius 2000 tout jeune, j’ai d’ailleurs longuement hésité à me diriger dans ce domaine après l'obtention de mon bac Economique et Social. J'ai finalement choisi une autre voie qui m’a amené, après l’obtention d’un Master Aménagement et Développement Territorial, à travailler durant 10 ans au sein d'une des plus grandes associations du pays (APF France handicap qui est composée de 100.000 acteurs associatifs dont 14.000 salariés) de défense des droits des personnes en situation de handicap. J'ai occupé trois postes (chargés de mission puis chef de projet) au sein de cette organisation durant lesquels j'ai pu renforcer mes compétences en pilotage de projets, en management transversal et d’animation de réseau d’acteurs, en développement du pouvoir d'agir, en stratégie de plaidoyers, en vision stratégique, en ingénierie de formation et leur animation... Pour illustrer, j'avais en charge le pilotage de projets d'inclusion ou de défense des droits (création d’un média associatif, animation du projet «la caravane des enfants» pour visibiliser les enfants en situation de handicap et leurs difficultés à s’inclure), d’actions de plaidoyers (rencontres avec des parlementaires et élus locaux, écriture de plaidoyers, organisation d’actions de revendications), l'accompagnement au développement du pouvoir d'agir des adhérents, de leurs proches et des bénévoles de l'association, l'animation d'un réseau d'accès au droit et un rôle d'appui stratégique aux élus ainsi qu'aux directions en Ile-de-France.\n\nCes dix années m'ont forgé sur le plan personnel et de ma posture professionnelle. Etre au service des dynamiques crées par les personnes concernées, les accompagner sur le développement de leur esprit critique et à fédérer un groupe d'individus autour d'objectifs communs nécessitent des qualités d'écoute, d’expression, d'empathie, de calme, rassurante afin de donner confiance, de médiation parfois, et de rigueur. Cette expérience participe à faire progresser son intelligence émotionnelle. Je sais alterner des postures de facilitation, de cheville ouvrière ou de meneur.\n\nBien que passionné par mon emploi, une forte envie de me remettre en question et de me lancer dans le «code» a ressurgi ces 5 dernières années, convaincu que l’informatique est un levier d’émancipation et de transformation de la société. Il m'a fallu du temps pour murir ce projet et trouver des financements.\n\nEn formation depuis le mois d'Octobre 2022 à plein temps, j'ai été confronté à différents langages (JavaScript, C#, Dart, PHP, SQL) dans le cadre de différents projets que vous retrouverez sur la page suivante.\n\nPour conclure, je recherche une alternance dans le développement Mobile, de préférence sur le Framework Flutter sur lequel je m’initie depuis plusieurs semaines (cette application est réalisée en Flutter). Je suis aussi prêt à m’investir pour apprendre d’autres langages natifs (Swift et Kotlin) selon les besoins de mon futur employeur. J’ai fait le choix de me spécialiser sur les applications pour Smartphones et tablettes pour les raisons suivantes : j'apprécie l’objet, son utilité et sa facilité d'utilisation pour tous (bien que demeure la fracture numérique produite par divers freins), rendant accessible à portée de pouces au développement de ses savoirs, à la presse, à créer des passerelles entre citoyens et services privé et public, à un nombre infini de produit (santé, sport, culture, consommation...), aux jeux et pouvant aussi aider à améliorer la participation citoyenne.Le secteur du mobile est toujours en phase d’expansion, le nombre de téléchargements a augmenté de plus de 80% en 5 ans, (source : https://fr.goodbarber.com/creer-app/94-marche-des-applications-mobiles-83-de-telechargements-en-5-ans/). Dans le monde, il y a plus de 3,2 milliards d'utilisateurs de smartphones et 1,14 milliard d'utilisateurs de tablettes, pour plus de 2,13 milliards de nouveaux téléchargements en France en 2022.\n\nEnfin, je suis mobilisateur du Tech for Good Tour initié par les organisations Latitudes et Tech for Good qui consiste à animer un temps de réflexion par l’intermédiaire sur les responsabilités, sociale, démocratique et écologique de la Tech.\n\nJe serais ravi d’apporter mes compétences et mon énergie pour votre équipe au service de vos projets."
          ),
        ],
      ),
    );
  }
}
