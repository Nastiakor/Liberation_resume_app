import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cv_flutter_libe/auth.dart';
import 'package:flutter/material.dart';

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

  void fetchNamebyID() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: user?.uid)
        .get();

    if (querySnapshot.docs.isEmpty) {
      print('Aucun document trouvé avec l\'ID spécifié');
      return;
    }

    DocumentSnapshot documentSnapshot = querySnapshot.docs[0];

    if (documentSnapshot.exists) {
      // Récupérer la valeur du champ "name"
      String nom = documentSnapshot.get('name');

      print('Le nom récupéré est : $nom');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('coucou');
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            ElevatedButton(
              child: Text('Fetch Name'),
              onPressed: fetchNamebyID,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Welcome')),
            ElevatedButton(
              child: Text("Sign out"),
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

