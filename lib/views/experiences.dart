import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';

class Experiences extends StatelessWidget {
  const Experiences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          MainArticle(
            imagePath: "img/Experiences/Lobby_Fabric.webp",
            title: "2018 - 2022 RECEPTIONNISTE",
            titlethen: " HOTELS A PARIS",
            paragraphMainArticle:
                "Pendant 5 ans, 'ai travaillé en tant que réceptionniste dans de divers hôtels à Paris.",
            themeMainArticle: "Réception",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-06 15:13:00",
            legendPicture: "",
            completeArticle:
                "- 2021 - 2022 Hôtel Paradis\n- 2018 - 2020 Hôtel Fabric\n- 2017 - 2018 Poste tournant: Hôtel des Marronniers, Hôtel des 2 Continents, Hôtel de Seine, Welcome Hôtel \n\nMes activités principales consistaient à accueillir et renseigner la clientèle, j'ai également fait de la conciergerie et du travail administratif : traitement des emails, prise, traitement et vérification des réservations, réponses aux commentaires des clients sur divers sites Internet, rédaction et traduction en anglais des brochures de communication)",
          ),
          APFArticle(
            imagePath: "img/Experiences/APF2.webp",
            title:
                "2016 - 2022 : CHEF DE PROJET REGIONAL ACTIONS ASSOCIATIVES ",
            titlethen: "APF FRANCE HANDICAP",
            paragraphMainArticle:
                "Durant 6 ans, j'ai oeuvré en tant que chef de projet régional en Ile-de-France pour l'association APF France handicap dont l'objet est la défense des droits des personnes en situation de handicap. J'avais pour missions principales de conseiller les élus, équipes et directions sur la stratégie de développement, d'accompagner le pouvoir d'agir des membres, d'animer des réseaux d'acteur et de piloter des projets.",
            themeMainArticle: "Gestion de projets",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-08 15:13:00",
            legendPicture:
                "Issu d'une action pour demander la mise en accessibilité du métro",
            completeArticle:
            "Cette expérience fut la plus marquante de mon parcours, elle m'aura permis de grandir aussi bien sur les plans professionnels et personnels. J'ai eu en charge des missions larges et passionnante, en interaction avec de nombreux et diversifiés acteurs. \n\n Mes missions principales furent les suivantes : \n\n- Piloter des projets régionaux \n- Soutenir la stratégie de plaidoyer et la défense des droits des personnes en situation de handicap (organisation de tables-rondes citoyennes et débats avec des secrétaires d'Etat, ministre, parlementaires et élus locaux, organisation d'actions collectives et de co-rédaction de plaidoyers, de projets tels que la 'caravane des enfants' ou de suivre des actions médiatiques - Le Monde - France Info ...)\n- Mettre en place un réseau de juristes et organiser des permanences juridiques en garantissant la qualité des réponses apportées.\n- Impulser, piloter et définir la stratégie du média de l'association (Webradio et Web-TV)\n- Participer à l'ingénierie de formation en direction des élus bénévoles et de les co-animer.\n- Organiser des sensibilisations dans les entreprises, espace public, salons (sur les thèmes de l'emploi, la formation, la vie affective et sexuelle...)\n- Organiser un réseau d'entraide d'aidants familiaux (action repair'aidants)\n\nToutes actions sont menées en mobilisant les citoyens et en les mettant au cœur des projets. Mon rôle était d'accompagnement le développement du pouvoir d'agir des acteurs, et de coordonner les équipes de salariés et bénévoles dans le cadre des projets dont j'avais la charge.\n\nCet emploi a contribué à renforcer mes savoirs et savoir-être suivants :\n- Gestion de projet\n- Travail en équipe \n- Management transversal\n- Animation d'un réseau d'acteurs, de fédérer et faire vivre un collectif \n- Ingénierie et animation de formation\n- Démarche partenariale \n- Impulser des dynamiques locales \n- Faciliter les échanges de savoirs et l'entraide d'un collectif \n- Mobiliser les citoyens autour d'un sujet qui leur tient à coeur, les accompagner à développer leur capacité individuelle et collective d'action.)",
          ),
          SecondaryArticle(
            imagePath: "img/Experiences/ERGONCAPITALPARTNERS.png",
            title:
                "2010 - 2016 ASSISTANTE DE DIRECTION GÉNÉRALE / OFFICE MANAGER",
            titlethen: " DIVERS ENTREPRISES A PARIS",
            paragraphMainArticle:
                "J'ai travaillé dans plusieurs entreprises en tant qu'Assistante de Direction Générale",
            themeMainArticle: "Secrétariat",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture: "",
            completeArticle:
                "- 2014 - 2016 Ergon Capital Advisors France\n- 2011 - 2014 Rietumu Bank\n- 2010 Moreno, Ruby et associés\n\nMes expérences: \n\nAccueil physique et téléphonique, interprétariat, traduction de documents, gestion d'agenda, organisation de réunions et de déplacements, gestion des dépenses, organisation du bureau",
          ),
          SecondaryArticle(
            imagePath: "img/Experiences/IEMNLG.webp",
            title: "2015 - 2016 : CHARGE DE MISSION SOCIOCULTUREL",
            titlethen:
                " AVEC DES ADOLESCENTS ET JEUNES ADULTES EN SITUATION DE HANDICAP ET POLYHANDICAP",
            paragraphMainArticle:
                "Lors de cet emploi que j'ai participé à créer, l'enjeu était de développer la participation citoyenne de ces jeunes âgés de 12 à 20 ans qui ont de fortes dépendances et se retrouvent malheureusement dans des situations d'exclusions sociales (scolaire, culturelle, sportive...), peu d'espaces leur étant accessible. Pour certains, le confinement, c'est toute l'année",
            themeMainArticle: "Inclusion",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-09 10:13:00",
            legendPicture:
                "Débat sur leurs difficultés à participer pleinement à la société",
            completeArticle:
            "L'Institut d'Education Motrice (composé de 40 jeunes de 12 à 20 ans en internat ou externat) propose un accompagnement éducatif (avec des enseignants détachés de l'Education Nationale et des éducateurs spécialisés) et médical (médecin, kinésithérapeute, ergothérapeute, psychomotricien...) en internat ou externat. En quelque sorte, l'Institut est une offre alternative au collège et lycée à des jeunes avec des besoins spécifiques afin d'avoir un parcours éducatif et médical adapté à leurs capacités dans un cadre sécurisant et collectif. La limite de ce type d'établissement est le repli et l'entre-soi qu'il peut générer, une forme 'bulles'. Cet effet pervers accentue l'exclusion sociale. Aucune offre n'était proposée par l'institut pour soutenir les jeunes dans leur implication dans la vie de leur quartier ou leur ville.\n\nMa mission était de travailler avec les jeunes et leurs familles à définir un projet autour d'une passion ou d'une volonté de participaiton citoyenne et de rechercher les adaptations et ressources possibles pour pallier à la situation de handicap. Et surtout de donner les clés aux jeunes et familles pour s'autonomiser et s'affranchir du suivi médico-social.\n\nEn parallèle, je soutenais les enseignantes et éducateurs dans leurs projets, j'organisais par exemple des échanges avec le collège voisin en mettant en place de cycles d'Education Physiques et Sportifs et d'activités en commun, en mixité, avec les jeunes de cet établissement scolaire. \n\nDévelopper le pouvoir d'agir de ces jeunes nécessite des qualités d'écoute, de compréhension, d'empathie pour donner confiance aux jeunes et à dévelopepr un esprit critique. Enfin, j'ai renforcé ma capacités à rédiger et piloter des projets et animer des dynamiques partenariales.",
          ),
          SecondaryArticle(
            imagePath: "img/Experiences/CiteDeLaMusique.png",
            title: "2011 HOTESSE D'ACCUEIL",
            titlethen: " CITÉ DE LA MUSIQUE",
            paragraphMainArticle:
                "",
            themeMainArticle: "Accueil",
            writtenBy: "Anastasia Korotkova",
            publishDateParam: "2023-03-06 10:13:00",
            legendPicture: "",
            completeArticle: "Accueil et renseignement des visiteurs, en français et en anglais. Préparation et organisation des évènements culturels. Traduction de brochures et de documents publicitaires (français - anglais)",
          ),
          SecondaryArticle(
            imagePath: "img/Experiences/APF93.webp",
            title: "2013 - 2015 : CHARGE DE MISSION ACTIONS ASSOCIATIVES",
            titlethen: " APF FRANCE HANDICAP - DELEGATION DU 93",
            paragraphMainArticle:
                "Premier emploi après l'obtention de mon Master Aménagement et Développement Territorial, j'ai occupé durant deux ans le poste de chargé de mission au développement de la vie associative de la délégation départementale de Seine-Saint-Denis APF France handicap.",
            themeMainArticle: "Inclusion",
            writtenBy: "Johan Anquetil",
            publishDateParam: "2023-03-09 12:10:00",
            legendPicture: "Actions d'évaluation de l'accessibilité à Bobigny",
            completeArticle:
            "Lors de ces deux années, j'ai contribué au développement de l'association en Seine-Saint-Denis. Composé de plus de 300 adhérents, nous mobilisions les adhérents autour d'actions et projets de défense des droits (accompagnement social, représentations dans les instances représentatives, sensibilisations dans les écoles et les entreprises, actions collectives) et d'inclusion sociale (mise en place d'ateliers socioculturels et de sorties de loisirs, partenariats avec La Villette, certaines villes de Seine-Saint-Denis et des centres culturels du département pour favoriser la visibilité du handicap).\n\nCette expérience m'a permis d'appliquer et développer les savoirs et savoir-faire suivant : \n\n-Gestion de projets\n-Diagnostic et évaluation\n-Animation de groupes de pairs\n-Management de bénévoles\n-Négociation",
          ),
        ],
      ),
    );
  }
}
