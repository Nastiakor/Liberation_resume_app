import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/pages/useradgents_feed.dart';
import 'package:cv_flutter_libe/services/useradgents_service.dart';
import 'package:cv_flutter_libe/models/useradgents.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:cv_flutter_libe/views/pages/useradgetsFullArticle.dart';

class UseradgentsPage extends StatefulWidget {
  const UseradgentsPage({Key? key}) : super(key: key);

  @override
  State<UseradgentsPage> createState() => _UseradgentsPageState();
}

class _UseradgentsPageState extends State<UseradgentsPage> {
  List<Useradgents> _UseradgentsContent = [];

  @override
  void initState() {
    super.initState();
    _fetchUseradgentsJSON();
  }

  _fetchUseradgentsJSON() async {
    var response = await UseradgentsService.fetchUseradgentsFeed();
    print(response);

    if (response.statusCode == 200) {
      // Si la requête a réussi
      // Convertir le corps de la réponse en une map
      List<dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      // Convertir la map en une liste de maps
      List<Useradgents> useradgentsList =
          jsonResponse.map((data) => Useradgents.fromJson(data)).toList();
      setState(() {
        _UseradgentsContent = useradgentsList;
      });
      print('first title${useradgentsList[0].title}');

      // Convertir chaque map en un objet Useradgents
    } else {
      // Gérer l'erreur
      print('Erreur lors de la récupération des données');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Useradgents feed',
      home: Scaffold(
        body: ListView.builder(
            itemCount: _UseradgentsContent.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                      builder: (context) => UseradgentsFullArticle(content: _UseradgentsContent[i].content ?? ''), // Passe le contenu ici
                  ),);
                },
                child: ListTile(
                  title: Text(_UseradgentsContent[i].title ?? ''),
                  subtitle:
                      Html(data: _UseradgentsContent[i].shortDescription ?? ''),
                ),
              );
            }),
      ),
    );
  }
}
