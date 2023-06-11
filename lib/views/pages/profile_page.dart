import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cv_flutter_libe/ressources/add_data.dart';
import 'package:cv_flutter_libe/services/auth.dart';
import 'package:cv_flutter_libe/views/add_recommendation.dart';
import 'package:cv_flutter_libe/utils/widget_tree.dart';


void checkCurrentUser() {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  print('Current user after relogin: $currentUser');
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
  final _whoiamController = TextEditingController();

  Future<bool> hasRecommendation(String candidateName) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String? userId = currentUser?.uid;

    if (userId != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Recommendations')
          .doc('$userId-$candidateName')
          .get();

      return documentSnapshot.exists;
    }

    return false;
  }

  void uploadProfileImage() async {
    if (_image != null) {
      StoreData storeData = StoreData();
      String userId = user?.uid ?? '';
      String imageUrl =
      await storeData.uploadImageToStorage('ProfileImage_$userId', _image!);

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
      setState(() {});
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

  void resetPageState() {
    _image = null;
    _nameController.text = '';
    _lastNameController.text = '';
    _whoiamController.text = '';

    // Réinitialisez d'autres états de la page si nécessaire
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    checkCurrentUser();
    resetPageState();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WidgetTree()),
    );
  }


  void updateUserDataDialog() async {
    String name = '';
    String lastName = '';
    String whoiam = '';

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    if (snapshot.exists) {
      var userDocument = snapshot.data() as Map<String, dynamic>?;
      if (userDocument != null && userDocument.containsKey('name')) {
        name = userDocument['name'];
        lastName = userDocument['lastName'];
        whoiam = userDocument['whoiam'];
        _nameController.text = name;
        _lastNameController.text = lastName;
        _whoiamController.text = whoiam;
      }
    }

    bool isDataChanged = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modifiez votre profil'),
          content: SingleChildScrollView(
            child: Column(
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
                ),  TextField(
                  controller: _whoiamController,
                  decoration: InputDecoration(
                    labelText: 'Qui es-tu ?',
                    hintText: 'Qui es-tu ?',
                  ),
                ),
              ],
            ),
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
                Navigator.of(context).pop();

                if (_nameController.text.isNotEmpty ||
                    _lastNameController.text.isNotEmpty) {
                  isDataChanged = true;
                }

                if (isDataChanged) {
                  updateUserData();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void updateUserData() async {

    if (_nameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty && _whoiamController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'name': _nameController.text,
        'lastName': _lastNameController.text,
        'whoiam': _whoiamController.text,
      });
      print('User name and last name updated successfully');
    }
    else if (_nameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty) {
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
    } else if (_whoiamController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'whoiam': _whoiamController.text,
      });
      print('User name and last name updated successfully');
    } else {
      print('Failed to update user name and last name');
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to your profile page'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
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
                            backgroundImage:
                            photoURL != null ? NetworkImage(photoURL) : null,
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
                      Text("Who I am: ${data['whoiam']}"),
                      Text("email: ${user?.email ?? 'User email'}"),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        onPressed: updateUserDataDialog,
                        child: Text('Modifier votre profil'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return RecommendationPage(
                                  candidateName: "Anastasia",
                                );
                              },
                            ),
                          );
                        },
                        child: FutureBuilder<bool>(
                          future: hasRecommendation("Anastasia"),
                          builder:
                              (BuildContext context, AsyncSnapshot<bool> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text("Something went wrong: ${snapshot.error}");
                            } else if (snapshot.hasData) {
                              bool hasRecommendation = snapshot.data!;
                              return Text(
                                hasRecommendation
                                    ? "Modifier votre recommandation pour Anastasia"
                                    : "Ajouter une recommandation pour Anastasia",
                              );
                            } else {
                              return Text("No data");
                            }
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return RecommendationPage(candidateName: "Johan");
                              },
                            ),
                          );
                        },
                        child: FutureBuilder<bool>(
                          future: hasRecommendation("Johan"),
                          builder:
                              (BuildContext context, AsyncSnapshot<bool> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text("Something went wrong: ${snapshot.error}");
                            } else if (snapshot.hasData) {
                              bool hasRecommendation = snapshot.data!;
                              return Text(
                                hasRecommendation
                                    ? "Modifier votre recommandation pour Johan"
                                    : "Ajouter une recommandation pour Johan",
                              );
                            } else {
                              return Text("No data");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text("No data");
              }
            } else {
              return Text("No data");
            }
          },
        ),
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
