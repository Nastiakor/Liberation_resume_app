import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cv_flutter_libe/auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = Auth().currentUser;
  Future<DocumentSnapshot>? documentSnapshot;

  @override
  void initState() {
    super.initState();
    documentSnapshot = fetchNamebyID();
  }

  Future<DocumentSnapshot> fetchNamebyID() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Welcome to our app');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  // void fetchNamebyID() async {
  //   // print(user?.uid);
  //   // QuerySnapshot querySnapshot =
  //   final documentSnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       // .where('id', isEqualTo: user?.uid)
  //       .doc(user?.uid)
  //       .get();
  //
  //   print(documentSnapshot.data());
  //
  //   var name = documentSnapshot['name'];
  //   var lastName = documentSnapshot['lastName'];
  //
  //   // if (querySnapshot.docs.isEmpty) {
  //   //  print('Aucun document trouvé avec l\'ID spécifié');
  //   // }
  //
  //   //if (documentSnapshot.exists) {
  //   // Récupérer la valeur du champ "name"
  //   //name = documentSnapshot.get('name');
  //
  //   //print('Le nom récupéré est : $name');
  //
  //   // }
  // }

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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user?.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Something went wrong: ${snapshot.error}");
          } else if (snapshot.hasData) {
            Map<String, dynamic>? data = snapshot.data!.data() as Map<String, dynamic>?;
            if (data != null) {
              return Column(
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
                  Text("Name: ${data['name']}"), // Display the name
                  Text("Last name: ${data['lastName']}"), // Display the last name
                  _userUid(),
                ],
              );
            } else {
              return Text("No data");
            }
          } else {
            return Text("No data");
          }
        },
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
