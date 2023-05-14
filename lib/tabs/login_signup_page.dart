import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cv_flutter_libe/auth.dart';

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
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,
          name: _controllerName.text,
          lastName: _controllerLastName.text);
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
    return Column(children: [
      TextField(
        style: const TextStyle(color: Colors.white),
        obscureText: false,
        controller: _controllerEmail,
        decoration: InputDecoration(
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
        obscureText: true,
        controller: _controllerPassword,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  width: 30, style: BorderStyle.solid, color: Colors.white),
            ),
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.white)),
      ),
    ]);
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
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      width: 30, style: BorderStyle.solid, color: Colors.white),
                ),
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      width: 30, style: BorderStyle.solid, color: Colors.white),
                ),
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      width: 30, style: BorderStyle.solid, color: Colors.white),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      width: 30, style: BorderStyle.solid, color: Colors.white),
                ),
                labelText: 'Password',
              ),
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
