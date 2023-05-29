import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  User? get user {
    return _firebaseAuth.currentUser;
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String lastName,
    String? photoURL,
  }) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    // get the user's UID
    String uid = userCredential.user!.uid;

    // store the additional user data in Firestore
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'lastName': lastName,
      'photoURL': photoURL,  // add the photoURL field here
      // any other fields you want to store
    });
  }


  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
