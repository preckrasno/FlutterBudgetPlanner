import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:flutter_budget_planner/models/user.dart';

class AuthServiceClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create custom user obj based on FirebaseUser object
  UserClass _userFromFirebaseUser(User user) {
    return user != null ? UserClass(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserClass> get user {
    log('Stream UserClass get user = ${_auth.authStateChanges().map((User user) => _userFromFirebaseUser(user))}');
    log('Stream UserClass get user short = ${_auth.authStateChanges().map(_userFromFirebaseUser)}');
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user)); // same to below
        .map(_userFromFirebaseUser);
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
