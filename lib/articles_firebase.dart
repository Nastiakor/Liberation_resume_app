import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_flutter_libe/view_articles_main_full_secondary.dart';

class ArticlesFirebase extends StatefulWidget {
  @override
  _ArticlesFirebaseState createState() => _ArticlesFirebaseState();
}

class _ArticlesFirebaseState extends State<ArticlesFirebase> {
  Future<List<DocumentSnapshot>> getMainDocumentByCondition(String collectionName, String field, dynamic value) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .limit(2)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs;
    } else {
      throw Exception('Aucun document ne correspond à la condition spécifiée.');
    }
  }

  Future<List<DocumentSnapshot>> getSecondaryDocumentByCondition(String collectionName, String field, dynamic value) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .get();
    
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs;
    } else {
      throw Exception('Aucun document ne correspond à la condition spécifiée.');
    }
        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          FutureBuilder<List<DocumentSnapshot>>(
        future: getMainDocumentByCondition('Articles', 'typeOfArticle', 'main'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            final documents = snapshot.data!;
            return Column(
              children: documents.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return MainArticle(
                  imagePath: "${data['imagePath']}",
                  titleHeadline: "${data['titleHeadline']} ",
                  titleOverline:"${data['titleOverline']}",
                  paragraphMainArticle: "${data['paragraphMainArticle']}",
                  themeMainArticle: "${data['themeMainArticle']}",
                  writtenBy: "${data['writtenBy']}",
                  publishDateParam: "2023-03-06 10:13:00",
                  legendPicture: "${data['legendPicture']}",
                  completeArticle: "${data['completeArticle']}",
                );
              }).toList(),
            );
          }
        },
      ),
          FutureBuilder<List<DocumentSnapshot>>(
            future: getSecondaryDocumentByCondition('Articles', 'typeOfArticle', 'secondary'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else {
                final documents = snapshot.data!;
                return Column(
                  children: documents.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return SecondaryArticle(
                      imagePath: "",
                      titleHeadline: "${data['titleHeadline']}",
                      titleOverline:
                      "DEUX ÉTUDIANTS EN DEVELOPPEMENT MOBILE. RÉCOMPENSE : ALTERNANCE",
                      paragraphMainArticle:
                      "En formation de développeuse et développeur d'applications au sein d'Ada Tech School depuis le mois d'octobre 2022, nous sommes à la recherche d'une alternance dans le développement mobile à partir du mois de juillet 2023 pour une durée d'un an.",
                      themeMainArticle: "Alternance",
                      writtenBy: "Anastasia et Johan",
                      publishDateParam: "2023-03-06 10:13:00",
                      legendPicture:
                      "En recherche d'alternance pour la période de juillet 2023 à juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
                      completeArticle:
                      "À travers cette application portfolio vous pourrez retrouver nos formations, expériences professionnelles et projets tech respectifs qui valorisent nos compétences et savoir-être. Vous pourrez également en apprendre un peu plus sur nos personnalités et lire le fil d'actualité de Libération (chargé grâce à l'action 'man-in-the-middle' et au token de l'un d'entre nous). Vous y trouverez également les 7 articles les plus consultés du New-York Times récupérés via leur API et affichés avec la charte graphique de Libération.\n\nNous sommes des étudiants en reconversion professionnelle engagés dans un processus d'apprentissage de près de deux ans, qui se décompose de la manière suivante :\n\n• un premier module théorique de 9 mois sur site\n•	un second module d'un an en alternance.\n\nTous les deux intéressés par le développement d'applications mobiles, nous avons décidé d'unir nos forces et une grande partie de notre temps afin de découvrir puis d'apprendre ensemble les bases de cet univers. Ce choix a également été dicté par le fait que l'école ne propose pas spécifiquement de cours sur le mobile hormis le dernier mois de formation, et aussi par le fait que nous sommes dans un cadre pédagogique avec des espaces de liberté. Travailler ensemble en peer-learning a été stimulant et a accéléré notre apprentissage. De plus, nous avons pu consolider notre capacité de travail en équipe.\nAprès réflexion et étude de marché, nous avons opté pour le SDK cross-plateforme Flutter et son langage Dart. Après une phase de découverte, nous nous sommes mis en mode projet et avons produit cette application pour rendre concrète cette montée en compétences. Nous avons créé ce portfolio commun, une application mobile en Flutter, et nous espérons qu'elle attirera votre attention. Nous pouvons également nous adapter à vos besoins et élargir nos compétences à d'autres contraintes techniques (Swift, Kotlin, etc.).\nPrécision importante pour faciliter votre lecture :\n\n•	si le titre commence en vert : il concerne Anastasia Korotkova\n•	si le titre commence en rouge : il concerne Johan Anquetil\n•	si le titre est en violet : il concerne tous les deux.\n\nNous avons fait le choix de ne produire qu'une seule application pour nos deux candidatures et non pas deux individuelles, car nous pensons que si l'un de nos deux profils vous intéresse, vous aurez plus facilement la possibilité de choisir, et si nos deux profils vous conviennent et que vous avez la capacité de nous accueillir ensemble, nous serions ravis de vous faire bénéficier de nos compétences, qui sont dopées par l'osmose que notre relation de travail a générée et qui s'est confirmée au fil de ces semaines de collaboration.",
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
    ),
    );
  }
}