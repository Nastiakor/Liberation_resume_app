import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, bool> softSkills = {
    "Communication": false,
    "Leadership": false,
    "Empathie": false,
    "Bienveillance": false,
    "Esprit d'équipe": false,
    "Tolérance": false,
    "Dynamisme": false,
  };
  Map<String, bool> hardSkills = {
    "C#": false,
    "JavaScript": false,
    "Java": false,
    "Flutter": false,
    "PHP": false,
    "Python": false,
    "Kotlin": false,
    "Swift": false,
    "Sql": false,
    "NoSql": false,
  };
  String additionalComments = "";
  TextEditingController _commentController = TextEditingController();

  String userId = 'exampleUserId';

  @override
  void initState() {
    super.initState();
    _fetchRecommendations();
  }

  _fetchRecommendations() async {
    DocumentSnapshot documentSnapshot = await _firestore.collection('Recommendations').doc(userId).get();

    if (documentSnapshot.exists) {
      List<dynamic> soft = documentSnapshot['soft'];
      List<dynamic> hard = documentSnapshot['hard'];
      additionalComments = documentSnapshot['comments'] ?? "";

      softSkills.forEach((skill, _) {
        softSkills[skill] = soft.contains(skill);
      });

      hardSkills.forEach((skill, _) {
        hardSkills[skill] = hard.contains(skill);
      });

      _commentController.text = additionalComments;

      setState(() {});
    }
  }


  _submitRecommendations() async {
    List<String> selectedSoftSkills = softSkills.keys.where((skill) => softSkills[skill]!).toList();
    List<String> selectedHardSkills = hardSkills.keys.where((skill) => hardSkills[skill]!).toList();

    await _firestore.collection('Recommendations').doc(userId).set({
      'candidate': 'Anastasia',
      'soft': selectedSoftSkills,
      'hard': selectedHardSkills,
      'comments': _commentController.text,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page de recommandation"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Soft Skills',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...softSkills.keys.map((skill) {
            return CheckboxListTile(
              title: Text(skill),
              value: softSkills[skill] ?? false,
              onChanged: (bool? newValue) {
                setState(() {
                  softSkills[skill] = newValue ?? false;
                });
              },
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hard Skills',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...hardSkills.keys.map((skill) {
            return CheckboxListTile(
              title: Text(skill),
              value: hardSkills[skill] ?? false,
              onChanged: (bool? newValue) {
                setState(() {
                  hardSkills[skill] = newValue ?? false;
                });
              },
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 5,
              controller: _commentController,
              decoration: InputDecoration(
                labelText: "Ajouter des commentaires",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _submitRecommendations,
            child: Text("Envoyer la recommandation"),
          ),
        ],
      ),
    );
  }
}
