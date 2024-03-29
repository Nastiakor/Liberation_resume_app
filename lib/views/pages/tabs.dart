import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_flutter_libe/models/secondary_article.dart';
import 'package:cv_flutter_libe/models/main_article.dart';

class tabsContent extends StatefulWidget {
  final String tabCategory;

  const tabsContent({super.key, required this.tabCategory});

  @override
  _tabsContentState createState() => _tabsContentState();
}

class _tabsContentState extends State<tabsContent> {

  bool isLoading = true; // Ajoutez cette variable d'état

  Future<List<DocumentSnapshot>> getMainDocumentByCondition(
      String collectionName,
      String field,
      dynamic value,
      String categories,
      String category) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .where(categories, isEqualTo: category)
        // .limit(7)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs;
    } else {
      throw Exception('Aucun document ne correspond à la condition spécifiée.');
    }
  }

  Future<List<DocumentSnapshot>> getSecondaryDocumentByCondition(
      String collectionName,
      String field,
      dynamic value,
      String categories,
      String category) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .where(categories, isEqualTo: category)
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
        children: [
          FutureBuilder<List<DocumentSnapshot>>(
            future: getMainDocumentByCondition(
                'Articles', 'typeOfArticle', 'main', 'category',widget.tabCategory),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else {
                final documents = snapshot.data!;
                return Column(
                  children: documents.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final date = data['publishDateParam'].toDate();
                    final formattedDate =
                        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}';
                    return MainArticle(
                        imagePath: "${data['imagePath']}",
                        titleHeadline: "${data['titleHeadline']} ",
                        titleOverline: "${data['titleOverline']}",
                        paragraphMainArticle: data['paragraphMainArticle'],
                        themeMainArticle: "${data['themeMainArticle']}",
                        writtenBy: "${data['writtenBy']}",
                        publishDateParam: formattedDate,
                        legendPicture: "${data['legendPicture']}",
                        completeArticle: "${data['completeArticle']}",
                        linkOrNot: "${data['linkOrNOt']}",
                        link: "${data['link']}",
                        imageOrNot: "${data['imageOrNot']}",
                        image: "${data['image']}");
                  }).toList(),
                );
              }
            },
          ),
          FutureBuilder<List<DocumentSnapshot>>(
            future: getSecondaryDocumentByCondition('Articles', 'typeOfArticle',
                'secondary', 'category', widget.tabCategory),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else {
                final documents = snapshot.data!;
                return Column(
                  children: documents.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final date = data['publishDateParam'].toDate();
                    final formattedDate =
                        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}';
                    return SecondaryArticle(
                        imagePath: "${data['imagePath']}",
                        titleHeadline: "${data['titleHeadline']} ",
                        titleOverline: "${data['titleOverline']}",
                        paragraphMainArticle: data['paragraphMainArticle'],
                        themeMainArticle: "${data['themeMainArticle']}",
                        writtenBy: "${data['writtenBy']}",
                        publishDateParam: formattedDate,
                        legendPicture: "${data['legendPicture']}",
                        completeArticle: "${data['completeArticle']}",
                        linkOrNot: "${data['linkOrNOt']}",
                        link: "${data['link']}",
                        imageOrNot: "${data['imageOrNot']}",
                        image: "${data['image']}");
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
