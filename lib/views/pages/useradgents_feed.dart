import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/pages/useradgents_feed.dart';
import 'package:cv_flutter_libe/services/useradgents_service.dart';
import 'package:cv_flutter_libe/models/useradgents.dart';
import 'dart:convert';

class UseradgentsPage extends StatefulWidget {
  const UseradgentsPage({Key? key}) : super(key: key);

  @override
  State<UseradgentsPage> createState() => _UseradgentsPageState();
}

class _UseradgentsPageState extends State<UseradgentsPage> {
  List<Useradgents> _UseradgentsContent = [];

  @override
  _fetchUseradgentsJSON() async {
    var response = await UseradgentsService.fetchUseradgentsFeed();
    print(response);

    if (response.statusCode == 200) {
      // Si la requête a réussi
      // Convertir le corps de la réponse en une liste
      List<dynamic> jsonResponse = jsonDecode(response.body);

      // Convertir chaque élément de la liste en un objet Useradgents
      setState(() {
        _UseradgentsContent =
            jsonResponse.map((data) => Useradgents.fromJson(data)).toList();
      });
    } else {
      // Gérer l'erreur
      print('Erreur lors de la récupération des données');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Useradgents feed',
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
