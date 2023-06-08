import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cv_flutter_libe/auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_flutter_libe/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

Uint8List? _image;
final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();


  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }


  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      String? downloadUrl;
      if(_image != null) {
        downloadUrl = await StoreData().uploadImageToStorage('ProfileImage', _image!);
      }
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        name: _controllerName.text,
        lastName: _controllerLastName.text,
        photoURL: downloadUrl,
      );
      setState(() {
        _image = null; // Réinitialiser l'image de profil à null
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }



  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _logIn() {
    return SingleChildScrollView(
      child: Column(
        children: [
      TextField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        obscureText: false,
        controller: _controllerEmail,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  width: 30, style: BorderStyle.solid, color: Colors.white),
            ),
            labelText: 'Email',
            labelStyle: const TextStyle(color: Colors.white)),
      ),
      const SizedBox(height: 10),
      TextField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        obscureText: true,
        controller: _controllerPassword,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  width: 30, style: BorderStyle.solid, color: Colors.white),
            ),
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.white)),
      ),
    ]),);
  }

  Padding _signUp({
    required TextEditingController nameController,
    required TextEditingController lastNameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                _image != null ?
                CircleAvatar(
                  radius: 65,
                  backgroundImage: MemoryImage(_image!),
                )
                    :
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: Image.asset("img/logos/profilepic.png"),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                  ),
                  bottom: -10,
                  left: 80,
                ),
               ],
            ),
            SizedBox(height: 15),
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              obscureText: false,
              controller: _controllerName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: 30, style: BorderStyle.solid, color: Colors.white),
                  ),
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              obscureText: false,
              controller: _controllerLastName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: 30, style: BorderStyle.solid, color: Colors.white),
                  ),
                  labelText: 'Last name',
                  labelStyle: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              obscureText: false,
              controller: _controllerEmail,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: 30, style: BorderStyle.solid, color: Colors.white),
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              controller: _controllerPassword,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: 30, style: BorderStyle.solid, color: Colors.white),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(
        isLogin ? 'Login' : 'Register',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }



  Widget loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
        isLogin ? 'Register instead' : 'Login instead',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Réinitialiser _image à null chaque fois que le widget est inséré dans l'arbre des widgets.
    _image = null;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.greenAccent,
              Colors.teal,
            ],
            // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLogin
                ? _logIn()
                : _signUp(
                    nameController: _controllerName,
                    lastNameController: _controllerLastName,
                    emailController: _controllerEmail,
                    passwordController: _controllerPassword),
            _errorMessage(),
            submitButton(),
            loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
class StoreData {

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {

    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(
      {required Uint8List file}
      )
  async {
    String resp = "some errors occured";
    try{
      String imageUrl = await uploadImageToStorage('ProfileImage', file);
      await _firestore.collection('users').add({

        'imageLink': imageUrl,
      });
      resp = "success";
    }
    catch(err)
    {
      resp = err.toString();
    }
    return resp;
  }
}

/*void saveProfile() async{
  String resp = await StoreData().saveData(file: _image!);
}*/