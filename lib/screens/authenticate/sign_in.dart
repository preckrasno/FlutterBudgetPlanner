import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/services/auth.dart';

class SignInWidgetClass extends StatefulWidget {
  @override
  _SignInWidgetClassState createState() => _SignInWidgetClassState();
}

class _SignInWidgetClassState extends State<SignInWidgetClass> {
  final AuthServiceClass _auth = AuthServiceClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to Budget Planner'),
      ),
      body: Container(
          child: RaisedButton(
        child: Text('Sign in anon'),
        onPressed: () async {
          dynamic result = await _auth.signInAnonMethod();
          if (result == null) {
            print('error signing in');
          } else {
            print('signed in');
            print(result);
          }
        },
      )),
    );
  }
}
