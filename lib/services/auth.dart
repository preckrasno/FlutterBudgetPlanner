import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthServiceClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anonymous
  Future signInAnonMethod() async {
    print('signInAnonMethod');
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      log('signInAnonMethod error = $e');
      return null;
    }
  }

  //sign in email

  //register email user

  //sign out

}
