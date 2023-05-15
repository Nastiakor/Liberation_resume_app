import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cv_flutter_libe/auth.dart';
import 'package:flutter/material.dart';

DocumentSnapshot? documentSnapshot;

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Welcome to our app');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Future<String?> fetchNamebyID() async {
    // print(user?.uid);
    String? name;
    // QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance
        .collection('users')
        // .where('id', isEqualTo: user?.uid)
        .doc(user?.uid)
        .get()
        .then((value) {
      print(value['lastName']);
      documentSnapshot = value;
    });

    // if (querySnapshot.docs.isEmpty) {
    //  print('Aucun document trouvé avec l\'ID spécifié');
    // }

    final docRef = db.collection("users").doc(user?.uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
      },
      onError: (e) => print("Error getting document: $e"),
    );

    //if (documentSnapshot.exists) {
    // Récupérer la valeur du champ "name"
    //name = documentSnapshot.get('name');

    //print('Le nom récupéré est : $name');

    // }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    // print(user?.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: _title(),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'img/85808-cherche-ancien-affiche-vectoriel.jpg',
                width: size,
                height: 150,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: myProfilePic(72),
                ),
              ),
            ],
          ),
          Row(
            children: [
              fetchNamebyID(),
              _userUid(),
            ],
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Welcome')),
            ElevatedButton(
              child: const Text("Sign out"),
              onPressed: () {
                signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

CircleAvatar myProfilePic(double radius) {
  return CircleAvatar(
      radius: radius, backgroundImage: AssetImage("img/image_0.png"));
}
