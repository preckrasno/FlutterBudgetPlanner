import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:flutter_budget_planner/models/user.dart';

class AuthServiceClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create custom user obj based on FirebaseUser object
  UserClass _userFromFirebaseUser(User user) {
    return user != null ? UserClass(uid: user.uid) : null;
  }

  //sign in anonymous
  Future signInAnonMethod() async {
    print('signInAnonMethod');
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      log('signInAnonMethod error = $e');
      return null;
    }
  }

  //sign in email

  //register email user

  //sign out

}
