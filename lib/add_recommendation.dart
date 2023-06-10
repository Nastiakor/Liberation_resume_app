  import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:cv_flutter_libe/tabs/profile_page.dart';


  class RecommendationPage extends StatefulWidget {
    final String candidateName;

    RecommendationPage({required this.candidateName});
    @override
    _RecommendationPageState createState() => _RecommendationPageState();
  }
  
  class _RecommendationPageState extends State<RecommendationPage> {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Map<String, bool> softSkills = {
      "Communication": false,
      "Adaptabilité": false,
      "Empathie": false,
      "Bienveillance": false,
      "Esprit d'équipe": false,
      "Tolérance": false,
      "Dynamisme": false,
      "Autonomie": false,
      "Esprit d'initiative": false,
      "Sens des responsabilités": false,
      "Résolution de conflits": false,
      "Confiance en soi": false,
      "Capacité à déléguer": false,
      "Intelligence émotionnelle": false,
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
      "NodeJS": false,
      "Firebase": false,
      "Supabase": false,
      "PostgreSQL": false,
      "Laravel": false,
      "Symfony": false,
    };
    String additionalComments = "";
    TextEditingController _commentController = TextEditingController();


    @override
    void initState() {
      super.initState();
      _commentController.addListener(() {
        additionalComments = _commentController.text;
      });
      _fetchRecommendations();
    }

    _fetchRecommendations() async {
      User? currentUser = FirebaseAuth.instance.currentUser;
      String? userId = currentUser?.uid;
      String docName = '$userId-${widget.candidateName}';

      DocumentSnapshot documentSnapshot = await _firestore.collection(
          'Recommendations').doc(docName).get();

      if (documentSnapshot.exists) {
        List<dynamic> soft = documentSnapshot['softSkills'] ?? [];
        List<dynamic> hard = documentSnapshot['hardSkills'] ?? [];
        additionalComments = documentSnapshot['additionalComments'] ?? "";

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



    Future<void> _submitRecommendations() async {
      User? currentUser = FirebaseAuth.instance.currentUser;
      String? userId = currentUser?.uid;
      String docName = '$userId-${widget.candidateName}';

      // Récupérer les softSkills et hardSkills sélectionnées
      List<String> selectedSoftSkills = softSkills.keys.where((
          skill) => softSkills[skill]!).toList();
      List<String> selectedHardSkills = hardSkills.keys.where((
          skill) => hardSkills[skill]!).toList();

      // Stocker les données dans Firestore (Assurez-vous d'utiliser le nom de la collection cohérent)
      await _firestore.collection('Recommendations').doc(docName).set({
        'softSkills': selectedSoftSkills,
        'hardSkills': selectedHardSkills,
        'additionalComments': additionalComments,
        // S'assurer que c'est mis à jour
        'recommendationFor': widget.candidateName,
        'recommenderId': userId,
        // S'assurer que c'est défini
      });

      print('Recommendation submitted!');

      // Fermer la page après avoir soumis la recommandation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ProfilePage(),
        ),
      );

    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Page de recommandation"),
        ),
        body: Center( // Ajouté pour centrer les éléments
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center( // Ajouté pour centrer le texte
                  child: Text(
                    'Soft Skills',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  // Ajouté pour centrer les boutons
                  spacing: 5.0,
                  // gap between chips
                  children: softSkills.keys.map((skill) {
                    return ChoiceChip(
                      avatar: CircleAvatar(
                        child: getIconForSoftSkill(skill),
                      ),
                      label: Text(skill),
                      selected: softSkills[skill]!,
                      selectedColor: Colors.orange[100],
                      // Ajouté pour changer la couleur de fond lorsque sélectionné
                      onSelected: (selected) {
                        setState(() {
                          softSkills[skill] = selected;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center( // Ajouté pour centrer le texte
                  child: Text(
                    'Hard Skills',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  // Ajouté pour centrer les boutons
                  spacing: 5.0,
                  // gap between adjacent chips
                  children: hardSkills.keys.map((skill) {
                    return ChoiceChip(
                      label: Text(skill),
                      selected: hardSkills[skill]!,
                      selectedColor: Colors.orange[100],
                      // Ajouté pour changer la couleur de fond lorsque sélectionné
                      onSelected: (selected) {
                        setState(() {
                          hardSkills[skill] = selected;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
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
              Center( // Ajouté pour centrer le bouton
                child: ElevatedButton(
                  onPressed: _submitRecommendations,
                  child: Text("Envoyer la recommandation"),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Icon getIconForSoftSkill(String skill) {
      switch (skill) {
        case 'Communication':
          return Icon(Icons.chat);
        case 'Adaptabilité':
          return Icon(Icons.compare_arrows);
        case 'Empathie':
          return Icon(Icons.favorite);
        case 'Bienveillance':
          return Icon(Icons.favorite_border);
        case 'Esprit d\'équipe':
          return Icon(Icons.group);
        case 'Tolérance':
          return Icon(Icons.accessibility_new);
        case 'Dynamisme':
          return Icon(Icons.flash_on);
        case 'Autonomie':
          return Icon(Icons.person_pin);
        case 'Esprit d\'initiative':
          return Icon(Icons.lightbulb_outline);
        case 'Sens des responsabilités':
          return Icon(Icons.assignment_turned_in);
        case 'Résolution de conflits':
          return Icon(Icons.how_to_vote);
        case 'Confiance en soi':
          return Icon(Icons.verified_user);
        case 'Capacité à déléguer':
          return Icon(Icons.work_outline);
        case 'Intelligence émotionnelle':
          return Icon(Icons.emoji_emotions);
        default:
          return Icon(Icons.star); // Icône par défaut
      }
    }
  }