import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecommandationPage extends StatefulWidget {
  const RecommandationPage({Key? key}) : super(key: key);

  @override
  _RecommandationPageState createState() => _RecommandationPageState();
}

// tentative d'animation
class _RecommandationPageState extends State<RecommandationPage> with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> getUserData(String userId) async {
    DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(userId).get();
    return userSnapshot.data() as Map<String, dynamic>;
  }

  Widget buildCardContent(
      Map<String, dynamic> data,
      List<String> hardSkills,
      List<String> softSkills,
      String authorName,
      String authorPhotoURL,
      String authorWhoIAm,
      String recommendationFor,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${data['additionalComments']}",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Compétences techniques:",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  for (var skill in hardSkills)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 12),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              skill,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16), // Ajustez cette valeur pour rapprocher les colonnes
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Compétences non techniques:",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  for (var skill in softSkills)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.blue, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            skill,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    final recommenders = ['Johan', 'Anastasia'];
    final recommendersList = <DocumentSnapshot>[];


    return Scaffold(
      body: FutureBuilder<List<QuerySnapshot>>(
        future: Future.wait(recommenders.map((recommender) {
          return _firestore
              .collection('Recommendations')
              .where('recommendationFor', isEqualTo: recommender)
              .get();
        }).toList()),
        builder: (BuildContext context, AsyncSnapshot<List<QuerySnapshot>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Erreur lors de la récupération des données');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          for (var querySnapshot in snapshot.data!) {
            recommendersList.addAll(querySnapshot.docs);
          }

          var alternateList = <DocumentSnapshot>[];
          for (int i = 0; i < recommendersList.length; i++) {
            if (i < recommendersList.length / 2) {
              alternateList.add(recommendersList[i]);
              var correspondingIndex = i + (recommendersList.length / 2).ceil();
              if (correspondingIndex < recommendersList.length) {
                alternateList.add(recommendersList[correspondingIndex]);
              }
            }
          }

          return PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: alternateList.length,
            itemBuilder: (context, index) {
              var document = alternateList[index];
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              List<String> hardSkills = List<String>.from(data['hardSkills']);
              List<String> softSkills = List<String>.from(data['softSkills']);
              String recommenderId = data['recommenderId'];
              String recommendationFor = data['recommendationFor'];

              return FutureBuilder<Map<String, dynamic>>(
                future: getUserData(recommenderId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasData) {
                    String authorName = "${snapshot.data!['name']} ${snapshot.data!['lastName']}";
                    String authorPhotoURL = snapshot.data!['photoURL'];
                    String authorWhoIAm = snapshot.data!['whoiam'];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onDoubleTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Recommandation pour $recommendationFor",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 3,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(authorPhotoURL),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(bottom: 6),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  authorName,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                authorWhoIAm,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    buildCardContent(
                                      data,
                                      hardSkills,
                                      softSkills,
                                      authorName,
                                      authorPhotoURL,
                                      authorWhoIAm,
                                      recommendationFor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Listener(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "Recommandation pour $recommendationFor",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? Colors.deepPurple.withOpacity(0.2)
                                          : Colors.deepOrange.withOpacity(0.2),
                                      border: Border.all(
                                        color: index.isEven ? Colors.deepPurple : Colors.deepOrange,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 3,
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(authorPhotoURL),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets.only(bottom: 6),
                                                      decoration: const BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        authorName,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Text(
                                                      authorWhoIAm,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "${data['additionalComments']}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Compétences techniques:",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    for (var skill in hardSkills)
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const Icon(
                                                              Icons.check_circle,
                                                              color: Colors.green,
                                                              size: 12,
                                                            ),
                                                            const SizedBox(width: 4),
                                                            Flexible(
                                                              child: Text(
                                                                skill,
                                                                style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Compétences non techniques:",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    for (var skill in softSkills)
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const Icon(
                                                              Icons.check_circle,
                                                              color: Colors.blue,
                                                              size: 12,
                                                            ),
                                                            const SizedBox(width: 4),
                                                            Flexible(
                                                              child: Text(
                                                                skill,
                                                                style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: Colors.black,
                                                                ),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text('Erreur lors de la récupération des données de l\'auteur');
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}