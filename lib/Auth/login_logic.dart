import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const String adminEmail = 'admin1@gmail.com';

final FirebaseAuth _auth = FirebaseAuth.instance;

void login(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user!.email == adminEmail) {
      Navigator.pushReplacementNamed(context, '/admin');
    } else {
      Navigator.pushReplacementNamed(context, '/student');
    }
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Login failed. Please try again.'),
    ));
  }
}
