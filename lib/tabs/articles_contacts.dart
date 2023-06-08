import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_flutter_libe/view_articles_main_full_secondary.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticlesContacts extends StatefulWidget {
  @override
  _ArticlesContactsState createState() => _ArticlesContactsState();
}

class _ArticlesContactsState extends State<ArticlesContacts> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mailController = TextEditingController();
  final messageController = TextEditingController();

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

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: [
          FutureBuilder<List<DocumentSnapshot>>(
            future: getMainDocumentByCondition(
                'Articles', 'typeOfArticle', 'main', 'category', 'Contact'),
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
                        contactOrNot: "${data['contactOrNot']}",
                        nextCompleteArticle: "${data['nextCompleteArticle']}");
                  }).toList(),
                );
              }
            },
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "LAISSEZ-NOUS UN MESSAGE",
                        style: GoogleFonts.encodeSansCondensed(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.purple,
                                fontSize: 20,
                                letterSpacing: 0.6)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Quel est votre prénom ?',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        controller: nameController,
                      ),
                      SizedBox(height: 15),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Quel est votre nom ?',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        controller: lastNameController,
                      ),
                      SizedBox(height: 15),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Veuillez saisir votre mail',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        controller: mailController,
                      ),
                      SizedBox(height: 15),
                      TextField(
                        maxLines: 15,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Veuillez saisir votre message ici',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        controller: messageController,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection('messages').add({
                              'name': nameController.value.text,
                              'lastName': lastNameController.value.text,
                              'mail': mailController.value.text,
                              'message': messageController.value.text,
                            }).then((_) {
                              // Réinitialisation des champs de texte
                              nameController.clear();
                              lastNameController.clear();
                              mailController.clear();
                              messageController.clear();

                              // Affichage de la Snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Message envoyé avec succès'),
                                ),
                              );
                            });
                          },
                          child: const Text("Envoyer"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
