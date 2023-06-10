import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:cv_flutter_libe/ressources/add_data.dart';
import 'package:cv_flutter_libe/auth.dart';
import 'package:cv_flutter_libe/add_recommendation.dart';
import 'package:cv_flutter_libe/add_article.dart';


void checkCurrentUser() {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  print('Current user after relogin: $currentUser'); // Vérifiez l'utilisateur dans la console
}
class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  final User? user = Auth().currentUser;
  String? photoURL;
  Future<DocumentSnapshot>? documentSnapshot;
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();

  void uploadProfileImage() async {
    if (_image != null) {
      StoreData storeData = StoreData();
      String userId = user?.uid ?? ''; // Récupérer l'ID de l'utilisateur
      String imageUrl = await storeData.uploadImageToStorage('ProfileImage_$userId', _image!);

      if (imageUrl.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .update({
          'photoURL': imageUrl,
        });

        setState(() {
          photoURL = imageUrl;
        });
        print('Profile image updated successfully');
      } else {
        print('Failed to upload profile image');
      }
    }
  }

  void selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image = await image.readAsBytes();
      setState(() {}); // Rafraîchir l'affichage de l'image immédiatement après la sélection
      uploadProfileImage();
    }
  }
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
    await FirebaseAuth.instance.signOut();
    checkCurrentUser();
    setState(() {
      _image = null; // Réinitialiser l'image de profil à null
    });
  }

  // à priori non utilisée
  void saveProfile() async {
    if (_image != null) {
      StoreData storeData = StoreData();
      String userId = user?.uid ?? '';
      String imageUrl = await storeData.uploadImageToStorage('ProfileImage_$userId', _image!);

      if (imageUrl.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .update({
          'photoURL': imageUrl,
        });

        print('Profile image updated successfully');
      } else {
        print('Failed to upload profile image');
      }
    }
  }

  void updateUserDataDialog() async {
    String name = '';
    String lastName = '';

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    if (snapshot.exists) {
      var userDocument = snapshot.data() as Map<String, dynamic>?;
      if(userDocument != null && userDocument.containsKey('name')) {
        name = userDocument['name'];
        lastName = userDocument['lastName'];
        _nameController.text = name;
        _lastNameController.text = lastName;
      }
    }

    bool isDataChanged = false; // Variable pour vérifier si les données ont été modifiées

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modifiez votre nom et prénom'),
          content: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  hintText: 'Entrez votre prénom ici',
                ),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Modifiez votre nom ici' + name,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Mettre à jour'),
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue

                // Vérifier si les champs de texte contiennent des données modifiées
                if (_nameController.text.isNotEmpty || _lastNameController.text.isNotEmpty) {
                  isDataChanged = true;
                }

                if (isDataChanged) {
                  updateUserData(); // Mettre à jour les données si des modifications ont été effectuées
                }
              },
            ),
          ],
        );
      },
    );
  }


  void updateUserData() async {

    if (_nameController.text.isNotEmpty && _lastNameController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'name': _nameController.text,
        'lastName': _lastNameController.text,
      });
      print('User name and last name updated successfully');
    } else if (_lastNameController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'lastName': _lastNameController.text,
      });
      print('User name and last name updated successfully');
    } else if (_nameController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'name': _nameController.text,
      });
      print('User name and last name updated successfully');
    }
    else {
      print('Failed to update user name and last name');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to your profile page'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Something went wrong: ${snapshot.error}");
          } else if (snapshot.hasData) {
            Map<String, dynamic>? data =
            snapshot.data!.data() as Map<String, dynamic>?;
            if (data != null) {
              final String? photoURL = data['photoURL'];
              print('Photo URL from Firestore: $photoURL');

              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundImage: photoURL != null ? NetworkImage(photoURL!) : null,
                          backgroundColor: Colors.white,
                          child: photoURL == null
                              ? Image.asset("img/logos/profilepic.png")
                              : null,
                        ),
                        Positioned(
                          top: 95,
                          left: 85,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: Icon(Icons.add_a_photo),
                          ),
                        ),
                      ],
                    ),

                    Text("Name: ${data['name']}"),
                    Text("Last name: ${data['lastName']}"),
                    Text("User email: ${user?.email ?? 'User email'}"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // couleur de fond du bouton
                        onPrimary: Colors.white, // couleur du texte
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // forme arrondie du bouton
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // espacement intérieur du bouton
                      ),
                      onPressed: updateUserDataDialog,
                      child: Text('Modifier votre nom et prénom'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // couleur de fond du bouton
                        onPrimary: Colors.white, // couleur du texte
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // forme arrondie du bouton
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // espacement intérieur du bouton
                      ),
                      child: const Text("Ajouter une recommandation pour Anastasia"),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return RecommendationPage();
                            },
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // couleur de fond du bouton
                        onPrimary: Colors.white, // couleur du texte
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // forme arrondie du bouton
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // espacement intérieur du bouton
                      ),
                      child: const Text("Ajouter une recommandation pour Johan"),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return RecommendationPage();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            {
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
              onPressed: signOut,
            ),
          ],
        ),
      ),
    );
  }
}
