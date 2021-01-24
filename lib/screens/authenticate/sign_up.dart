import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/services/auth.dart';

class SignUpWidgetClass extends StatefulWidget {
  @override
  _SignUpWidgetClassState createState() => _SignUpWidgetClassState();
}

class _SignUpWidgetClassState extends State<SignUpWidgetClass> {

  final AuthServiceClass _auth = AuthServiceClass();

  // text field statefulWidget
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up to Budget Planner'),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Sign up'),
                onPressed: () async {
                  print('sign_in.dart email = $email, password = $password.');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}