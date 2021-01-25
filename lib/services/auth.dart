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
      print('auth.dart anon user obj before changes $user');
      return _userFromFirebaseUser(user);
    } catch (e) {
      log('signInAnonMethod error = $e');
      return null;
    }
  }

  //sign in email
  Future signInWithEmailPassword(String email, String password) async {
    try {
      //They renamed the class AuthResult to UserCredential
      UserCredential  result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      //the class FirebaseUser was changed to User
      User user = result.user;
      print('auth.dart original user = $user');
      print('auth.dart custom user = ${_userFromFirebaseUser(user)}');
      return _userFromFirebaseUser(user); 
    } catch (e) {
      print('auth.dart register error:"$e"');
      return null;
    }
  }

  //register email user
  Future registerWithEmailPassword(String email, String password) async {
    try {
      //They renamed the class AuthResult to UserCredential
      UserCredential  result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //the class FirebaseUser was changed to User
      User user = result.user;
      print('auth.dart original user = $user');
      print('auth.dart custom user = ${_userFromFirebaseUser(user)}');
      return _userFromFirebaseUser(user); 
    } catch (e) {
      print('auth.dart register error:"$e"');
      return null;
    }
  }

  //sign out
  Future signOutFunction() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('signOutFunction error = $e');
      return null;
    }
  }
}
