import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/view_articles_main_full_secondary.dart';

class Formations extends StatelessWidget {
  const Formations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          MainArticle(
            imagePath: "img/Formations/AdaTechschool2.png",
            titleHeadline: "2022 - 2023 : ADA TECH SCHOOL ",
            titleOverline:
                "ECOLE FEMINISTE BASEE SUR UNE PEDAGOGIE INNOVANTE ET FORMANT DES DÉVELOPPEUSES / DÉVELOPPEURS D'APPLICATIONS FULL STACK",
            paragraphMainArticle:
                "Tous les deux étudiants au sein de la promotion Dorothy Vauhan d'Ada Tech School, cette formation nous prépare en deux ans aux métiers du développement informatique (Mobile, back-end et front-end) grâce à la pédagogie Montessori et à des projets collectifs.",
            themeMainArticle: "Reconversion",
            writtenBy: "Johan et Anastasia",
            publishDateParam: "2023-03-07 10:13:00",
            legendPicture: "Promotion Dorothy Vaughan - Paris 10e",
            completeArticle:
            "Ada Tech School, jeune école créée en 2019 lancée à Paris puis à Nantes, est singulière. Elle ne forme pas seulement des développeuses et des développeurs par la transmission de savoirs techniques. Son projet pédagogique porte des valeurs fortes : défense de la place des femmes dans les métiers de la tech, valorisation des soft-skills et du travail en équipe dans des logiques de pair-learning.\n\nSelon le rapport DESI 2020, seulement 18 % des spécialistes des TIC en Europe sont des femmes. Pour contrer cette situation, alors que les métiers de la Tech conditionnent nos vies de plus en plus, il n'est pas envisageable que les outils du quotidien soient pensés et conçus par des hommes. De plus, les métiers de la Tech favorisent l'émancipation ! Ada Tech School se donne les moyens de ses ambitions : une majorité d'apprenants sont des apprenantes, des sensibilisations sur cet enjeu sont organisées au sein de l'école, d'universités, de salons et d'entreprises afin de faire bouger les lignes.  \n\nLa méthode a été inspirée par la célèbre pédagogue italienne Maria Montessori. Pas de cours magistraux, pas d'examens. Pour ce faire, l'apprentissage se réalise soit grâce à des projets concrets et variés de groupe de 3-4 personnes sur des périodes de deux semaines, soit lors des semaines dites 'arbres', où, en binôme, nous explorons des concepts théoriques. Le rythme est basé sur des itérations de quinze jours, 2 semaines de projets collectifs, 2 semaines d'apprentissages théoriques. \nLe travail en équipe permanent facilite le développement de 'soft-skills', permet de mettre en place des daily et des reviews, d'organiser la coopération, de savoir découper des tâches ou d'oeuvrer en pair-programming, de pouvoir adapter son rythme à ses collègues et à être à l'écoute des attentes, besoins et rythmes de chacun pour mieux s'entraider. \n\nDeux encadrants professionnels se relaient quotidiennement pour nous accompagner, nous soutenir, et faire part de leurs expériences dans un cadre positif et bienveillant. \n\nChez Ada, nous n'apprenons pas des langages en particulier, nous apprenons la programmation en général, ses paradigmes, pour nous rendre adaptables à différentes technologies. Nous passons d'un langage à un autre régulièrement. \n\nVous pourrez retrouver nos projets dans l'onglet dédié qui ont été réalisés en : \n\n - PHP \n - JavaScript avec ses Frameworks \n - LUA \n - Dart (Flutter) \n - MySQL   ",
            linkOrNot: "Le site D'Ada Tech School",
          ),
          SecondaryArticle(
            imagePath: "img/Formations/techforgood.png",
            titleHeadline: "2023 : TECH FOR GOOD TOUR ",
            titleOverline: "FORMATION DE MOBILISATEUR",
            paragraphMainArticle:
                "Le saviez-vous ?\n97% des sites ne sont pas accessibles.\n\nLes organisations 'Tech for good' et Latitudes ont décidé de se mobiliser conjointement afin de proposer aux personnes concernées de se questionner sur les impacts de la Tech.\nDans ce cadre, des sensibilisations sont mises en place s’adressant aux citoyens : étudiant·es, apprenant·es, employé·es, freelances ou encore membres de communautés.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-07 12:29:00",
            legendPicture: "Logo du tech for good tour",
            completeArticle:
                "Le Tech for Good tour, coordonné par deux professionnels et animé par des bénévoles dont je fais partie, part à l'assaut de l'hexagone pour éveiller les consciences aux enjeux de la Tech. Créé en 2019 par makesense et Latitudes, le Tech for Good Tour est un tour de France visant à accélérer les réflexions et le passage à l’action pour construire une tech plus engagée et responsable. \n\nLa conviction est que, utilisée à bon escient, la technologie peut faire partie de la réponse aux problèmes sociaux et environnementaux de notre époque, \n\nPour ce faire, Tech for good et Latitudes nous ont formés sur deux volets : \n\n - Pédagogique : Comment animer cet atelier dans une logique de facilitation ? Pour faire discuter et pousser aux réflexions individuelles, collectives à propos des conséquences et à devenir force de proposition sur des alternatives, voire s'engager, nous animons un atelier articulé autour d'un jeu de cartes à piocher puis à positionner sur une matrice en petits groupes.\n\n - Technique : Quels sont les constats, analyses, opportunités et menaces ?\nJ'ai pu découvrir les enjeux de la Tech afin de rendre les outils numériques plus accessibles, divers, sobres, respectueux de l'humain. \n\nLa formation s'étale sur un mois, avec un rythme de 5 heures d'apprentissage théorique hebdomadaire et 3 visio-conférences d'échange et de test de l'atelier.\n\nGrâce à cet engagement bénévole, j'ai pu développer des compétences en :\n - Communication \n - Animation de groupe\n - Transmission d'idées\n - Impulsion des réflexions et des dynamiques de groupe \n - Travail en équipe",
          ),
          SecondaryArticle(
            imagePath: "img/Formations/logoESIT.png",
            titleHeadline: "2020 - 2021 :",
            titleOverline:
                " MASTER 1 TRADUCTION ÉDITORIALE, ÉCONOMIQUE ET TECHNIQUE",
            paragraphMainArticle:
                "ESIT (ÉCOLE SUPÉRIEURE D’INTERPRÈTES ET DE TRADUCTEURS)",
            themeMainArticle: "Anastasia",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-08 11:55:00",
            legendPicture: "Logo de l'ESIT",
            completeArticle: "Ma formation à l'ESIT dont l'enseignement est basé sur la Théorie interprétative de la traduction m'a permis d'acquérir des compétences en traduction, ainsi que d'enrichir ma culture générale grâce à des cours d'économie, d'introduction au droit, de fondements scientifiques et techniques, des outils informatiques du traducteur etc.",
          ),
          SecondaryArticle(
            imagePath: "img/Formations/UnivEvry.png",
            titleHeadline: "2009 - 2011 : ",
            titleOverline: "MASTER AMENAGEMENT ET DEVELOPPEMENT TERRITORIAL",
            paragraphMainArticle:
                "Après l'obtention de ma Licence et une année de réflexion, j'ai décidé de me tourner vers ce Master qui forme des cadres territoriaux et associatifs dans le développement social local.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-08 10:29:00",
            legendPicture: "",
            completeArticle:
                "Lors de ces deux années, j'ai pu acquérir compétences transversales, managériales, organisationnelles, de pilotage de projets, de fonctionnement des Collectivités Territoriales, aux politiques publiques d'Aménagement Territorial.\n\nLors de mes deux stages effectués au sein des villes de Courcouronnes et de Vitry-sur-Seine, j'avais pour mission d'évaluer des coûts d'équipements sportifs, de réaliser un film promotionnel du service.\n\nMon mémoire questionnait les valeurs d'éducation et le vecteur d'inclusion du sport.",
          ),
          SecondaryArticle(
            imagePath: "img/Formations/Logo_Paris_Descartes.png",
            titleHeadline: "2006 - 2009 :",
            titleOverline: " LICENCE 3 - MASTER 1 SCIENCES DU LANGAGE",
            paragraphMainArticle: "UNIVERSITÉ PARIS V DESCARTES",
            themeMainArticle: "Anastasia",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-08 11:55:00",
            legendPicture: "",
            completeArticle:
                "Diplômes obtenus:\n\n- Master 2 Sciences du langage (niveau)\n- Master 1 Sciences du langage (mention Bien)\n- Licence 3 Sciences du langage, spécialité Français Langue Étrangère (mention Bien)\n\n"
                "Cette formation m'a permis de développer une connaissance approfondie de la structure des langues, de l'\analyse du discours, ainsi que des notions en Sociolinguistique, en Sémantique, en Pragmatique etc."
          ),
          SecondaryArticle(
            imagePath: "img/Formations/STAPSLYON1.png",
            titleHeadline: "2007 - 2008 :",
            titleOverline: " LICENCE STAPS MANAGEMENT DES ORGANISATIONS SPORTIVES",
            paragraphMainArticle:
                "Suite à mon DUT, je me suis orienté sur la filière STAPS à Lyon, séduit par l'opportunité de m'installer dans une grande ville et de poursuivre mon cursus dans le domaine du sport",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-08 10:29:00",
            legendPicture:
                "Département Sciences et Techniques des Activités Physiques et Sportives de l'Université Lyon 1",
            completeArticle:
                "La Licence 3 Management des Organisations Sportives prépare aux métiers de développement et du Marketing dans le champ du sport. Ma volonté était à l'époque de travailler au sein d'un club professionnel. \n\n J'ai effectué mon stage au sein du Villeurbanne Handball Association (qui était en D2 à l'époque et redescendait de 1ère division avec l'ambition de remonter) avec pour feuille de route de développer les partenariats et proposer un nouveau site Internet (que j'ai conçu). \n\n J'ai également été acteur d'une opération de Marketing avec l'ASVEL (Association Sportive Villeurbanne Eveil Lyonnais) de vente de places d'un match de coupe d'Europe.",
          ),
          SecondaryArticle(
            imagePath: "img/Formations/pedInstitut.jpg",
            titleHeadline: "2000 - 2005 :",
            titleOverline: " MASTER PROFESSEURE D'ANGLAIS ET DE FRANÇAIS",
            paragraphMainArticle:
                "INSTITUT PÉDAGOGIQUE DE IOCHKAR-OLA (RUSSIE)",
            themeMainArticle: "Anastasia",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-08 12:32:00",
            legendPicture: "",
            completeArticle: "Master 2 Langues Étrangères (mention Très Bien)\n\nCette formation m'a permis d'avoir une connaissance approfondie d'anglais et de français, de la culture des pays anglophones et francopones, j'ai également pu apprendre les théories de l'enseignement et de l'apprentissage, ainsi que les stratégies pédagogiques pour enseigner efficacement les langues étrangères",
          ),
          SecondaryArticle(
            imagePath: "img/Formations/IUTIndre.png",
            titleHeadline: "2005 - 2007 :",
            titleOverline: " DUT TECHNIQUES DE COMMERCIALISATION",
            paragraphMainArticle:
                "Après avoir obtenu mon Baccalauréat Economique et Social à Bourges, j'ai passé deux ans à Issoudun et son IUT de l'Indre.",
            themeMainArticle: "Johan",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-08 10:29:00",
            legendPicture: "Issoudun, ville située entre Bourges et Chateauroux",
            completeArticle:
                "Le Diplôme Universitaire de Technologie (DUT) Techniques de Commercialisation. La formation permet aux étudiantes et étudiants d’acquérir de solides connaissances générales dans le domaine du marketing, de la négociation, des études commerciales, etc. mais également en achat, stratégie, psychosociologie des organisations, logistique, etc.",
          ),
        ],
      ),
    );
  }
}
