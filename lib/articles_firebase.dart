import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                return ListTile(
                  title: Text('${data['titleHeadline']}'),
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
                    return ListTile(
                      title: Text('${data['titleHeadline']}'),
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
