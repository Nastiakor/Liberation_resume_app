import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/app_bottom_bar/bottom_navigation_bar.dart';
import 'package:cv_flutter_libe/views/home_page.dart';
import 'package:cv_flutter_libe/views/projects.dart';
import 'package:cv_flutter_libe/views/experiences.dart';
import 'package:cv_flutter_libe/views/contact.dart';
import 'package:cv_flutter_libe/views/formations.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlesFirebase extends StatefulWidget {
  const ArticlesFirebase({Key? key}) : super(key: key);

  @override
  _ArticlesFirebaseState createState() => _ArticlesFirebaseState();
}

class _ArticlesFirebaseState extends State<ArticlesFirebase> {
  final Stream<QuerySnapshot> _articlesStream =
      FirebaseFirestore.instance.collection('Articles').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _articlesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['titleHeadline']),
              subtitle: Text(data['titleOverline']),
            );
          }).toList(),
        );
      },
    );
  }
}
