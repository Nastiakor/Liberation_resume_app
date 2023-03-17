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
      child: Column(children: [
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
          legendPicture: "Promotion Dorothy Vaughan - Paris 10e",
          completeArticle:
              "Ada Tech School, jeune école créée en 2019 lancée à Paris puis à Nantes, est singulière. Elle ne forme pas seulement des développeuses et des développeurs par la transmission de savoirs techniques. Son projet pédagogique porte des valeurs fortes : défense de la place des femmes dans les métiers de la tech, valorisation des soft-skills et du travail en équipe dans des logiques de pair-learning.\n\nSelon le rapport DESI 2020, seulement 18 % des spécialistes des TIC en Europe sont des femmes. Pour contrer cette situation, alors que les métiers de la Tech conditionnent nos vies de plus en plus, il n'est pas envisageable que les outils du quotidien soient pensées et conçus par des hommes. De plus, les métiers de la Tech favorisent l'émancipation ! Ada Tech School se donne les moyens de ses ambitions : une majorité d'apprenants à l'école sont des apprenantes, des sensibilisations sur cet enjeu sont organisées au sein de l'école, d'universités, de salons et d'entreprises afin de faire bouger les lignes.  \n\nLa méthode a été inspirée par la célèbre pédagogue italienne Maria Montessori. Pas de cours magistraux, pas d'examens, une liberté totale. Pour ce faire, l'apprentissage se réalise soit grâce à des projets concrets et variés de groupe de 3-4 personnes sur des périodes de deux semaines, soit lors des semaines dites 'arbres', où, en binôme, nous explorons des concepts théoriques. Le rythme est basée sur des itérations de quinze jours, 2 semaines de projets collectifs, 2 semaines d'apprentissages théoriques. \nLe travail en équipe permanent facilite le développement de 'soft-skills', permet de mettre en place des daily et des reviews, d'organiser la coopération, de savoir découper des tâches ou d'oeuvrer en pair-programming, de pouvoir adapter son rythme à ses collègues et à être à l'écoute des attentes, besoins et rythmes de chacun pour mieux s'entraider. \n\nDeux encadrants professionnels se relaient quotidiennement pour nous accompagner, nous soutenir, et faire part de leurs expériences dans un cadre positif et bienveillant. \n\nChez Ada, nous n'apprenons pas des langages en particulier, nous apprenons la programmation en général, ses paradigmes, pour nous rendre adaptables à différentes technologies. Nous passons d'un langage à un autre régulièrement. \n\nVous pourrez retrouver nos projets dans l'onglet dédiés qui ont été réalisés en : \n\n - PHP \n - JavaScript avec ses Frameworks \n - LUA \n - Dart (Flutter) \n - MySQL   ",
        ),
        SecondaryArticle(
          imagePath: "img/Formations/techforgoodtour.png",
          title: "2023 : TECH FOR GOOD TOUR ",
          titlethen: "FORMATION DE MOBILISATEUR",
          paragraphMainArticle:
              "Le saviez-vous ?\n97% des sites ne sont pas accessibles.\n\nLes organisations 'Tech for good' et Latitudes ont décidé de se mobiliser conjointement afin de proposer aux personnes concernées de se questionner sur les impacts de la Tech.\nDans ce cadre, une tournée de sensibilisation d'envergure est mise en place avec des ateliers s’adressant aux citoyens ayant ou développant des compétences tech : étudiant·es, apprenant·es, employé·es, freelances ou encore membres de communautés.",
          themeMainArticle: "Engagement",
          writtenBy: "Johan Anquetil",
          publishDateParam: "2023-03-07 12:29:00",
          legendPicture: "Logo du tech for good tour",
          completeArticle:
              "Le Tech for Good tour, coordonné par deux professionnels et animé par des bénévoles dont je fais partie, pars à l'assaut de l'hexagone pour éveiller les consciences aux enjeux de la Tech. Créé en 2019 par makesense et Latitudes, le Tech for Good Tour est un tour de France visant à accélérer les réflexions et le passage à l’action pour construire une tech plus engagée et responsable. \n\nLa conviction est que, utilisée à bon escient, la technologie peut faire partie de la réponse aux problèmes sociaux et environnementaux de notre époque, \n\nPour ce faire, Tech for good et Latitudes nous ont formés sur deux volets : \n\n - Pédagogique : Comment animer cet atelier dans une logique de facilitation ? Pour faire discuter et pousser aux réflexions individuelles, collectives à propos des conséquences et à devenir force de proposition sur des alternatives, voire s'engager, nous animons un atelier articulé autour d'un jeu de cartes à piocher puis à positionner sur une matrice en petits groupes.\n\n - Technique : Quels sont les constats, analyses, opportunités et menaces ?\nJ'ai pu découvrir les enjeux de la Tech afin de rendre les outils numérique plus accessibilité, diverse, sobre, respectueux de l'humain. \n\nLa formation s'étale sur un mois, avec un rythme de 5 heures d'apprentissage théoriques hebdomadaires et 3 visio-conférences d'échange et de test de l'atelier.\n\nGrâce à cet engagement bénévole, j'ai pu développer :\n - Communication \n - Animation de groupe\n - Transmission d'idées\n - impulser des réflexions et des dynamiques de groupe \n - Travail en équipe \n - Accompagner les prises de conscience \n - Organisation",

            ),
            SecondaryArticle(
              imagePath: "img/Formations/logoESIT.png",
              title: "2020 - 2021 :",
              titlethen: " MASTER 1 TRADUCTION ÉDITORIALE, ÉCONOMIQUE ET TECHNIQUE",
              paragraphMainArticle:
              "ESIT (ÉCOLE SUPÉRIEURE D’INTERPRÈTES ET DE TRADUCTEURS)",
              themeMainArticle: "Traduction",
              writtenBy: "Anastasia Korotkova",
              publishDateParam: "2023-03-08 11:55:00",
              legendPicture: "",
              completeArticle: "",
            ),
            SecondaryArticle(
              imagePath: "img/Formations/UnivEvry.png",
              title: "2009 - 2011 : ",
              titlethen:
              "MASTER AMENAGEMENT ET DEVELOPPEMENT TERRITORIAL",
              paragraphMainArticle: "Après l'obtention de ma Licence et une année de réflexion, j'ai décidé de me tourner vers ce Master qui forme des cadres territoriaux et associatifs dans le développement social local.",
          themeMainArticle: "Social",
          writtenBy: "Johan Anquetil",
          publishDateParam: "2023-03-08 10:29:00",
          legendPicture: "",
          completeArticle:
              "Lors de ces deux années, j'ai pu acquérir compétences transversales, managériales, organisationnelles, de pilotage de projets, de fonctionnement des Collectivités Territoriales, aux politiques publiques d'Aménagement Territorial.\n\nLors de mes deux stages effectués au sein des villes de Courcouronnes et des Ulis, j'avais pour mission d'évaluer des coûts d'équipements sportifs, de réaliser un film promotionnel du service.\n\nMon mémoire questionnait les valeurs d'éducation et le vecteur d'inclusion du sport.",
        ),
        SecondaryArticle(
          imagePath: "img/Formations/STAPSLYON1.png",
          title: "2007 - 2008 :",
          titlethen: " LICENCE STAPS MANAGEMENT DES ORGANISATIONS SPORTIVES",
          paragraphMainArticle:
              "Suite à mon DUT, ma priorité était de m'inscrire dans une carrière liée au monde professionnel du sport",
          themeMainArticle: "Management",
          writtenBy: "Johan Anquetil",
          publishDateParam: "2023-03-08 10:29:00",
          legendPicture:
              "Département Sciences et Techniques des Activités Physiques et Sportives de l'Université Lyon 1",
          completeArticle:
              "La Licence 3 Management des Organisations Sportives prépare aux métiers de développement et du Marketing dans le champ du sport. Ma volonté était à l'époque de travailler au sein d'un club professionnel. \n\n J'ai effectué mon stage au sein du Villeurbanne Handball Association (qui était en D2 à l'époque et redescendait de 1ère division avec l'ambition de remonter) avec pour feuille de route de développer les partenariats et proposer un nouveau site Internet (que j'ai conçu). \n\n J'ai également été acteur d'une opération de Marketing avec l'ASVEL (Association Sportive Villeurbanne Eveil Lyonnais) de vente de places d'un match de coupe d'Europe.",
            ),
            SecondaryArticle(
              imagePath: "img/Formations/Logo_Paris_Descartes.png",
              title: "2006 - 2009 :",
              titlethen: " LICENCE 3 - MASTER 1 SCIENCES DU LANGAGE",
              paragraphMainArticle: "UNIVERSITÉ PARIS V DESCARTES",
              themeMainArticle: "Sciences du langage",
              writtenBy: "Anastasia Korotkova",
              publishDateParam: "2023-03-08 11:55:00",
              legendPicture: "",
              completeArticle:
              "- Master 2 Sciences du langage (niveau)\n- Master 1 Sciences du langage (mention Bien)\n- Licence 3 Sciences du langage, spécialité Français\n  Langue Étrangère (mention Bien)",
            ),
            SecondaryArticle(
              imagePath: "img/Formations/IUTIndre.webp",
              title: "2005 - 2007 :",
              titlethen:
              " DUT TECHNIQUES DE COMMERCIALISATION",
              paragraphMainArticle:
              "Après avoir obtenu mon Baccalauréat Economique et Social à Bourges, j'ai passsé deux ans à Issoudun et son IUT de l'Indre.",
              themeMainArticle: "Commerce",
              writtenBy: "Johan Anquetil",
              publishDateParam: "2023-03-08 10:29:00",
              legendPicture:
              "Issoudun, ville situé entre Bourges et Chateauroux",
              completeArticle:
              "Le Diplôme Universitaire de Technologie (DUT) Techniques de Commercialisation. La formation permet aux étudiantes et étudiants d’acquérir de solides connaissances générales dans le domaine du marketing, de la négociation, des études commerciales, etc. mais également en achat, stratégie, psychosociologie des organisations, logistique, etc.",
            ),
            SecondaryArticle(
              imagePath: "img/Formations/pedInstitut.jpg",
              title: "2000 - 2005 :",
              titlethen: " MASTER PROFESSEURE D'ANGLAIS ET DE FRANÇAIS",
              paragraphMainArticle: "INSTITUT PÉDAGOGIQUE DE IOCHKAR-OLA (RUSSIE)",
              themeMainArticle: "Langues étrangères",
              writtenBy: "Anastasia Korotkova",
              publishDateParam: "2023-03-08 12:32:00",
              legendPicture: "",
              completeArticle: "Master 2 Langues Étrangères (mention Très Bien)",
            ),
          ]
        ),
      ]),
    );
  }
}
