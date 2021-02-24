import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/services/auth.dart';

class SignInWidgetClass extends StatefulWidget {
  
  final Function toggleViewParam;
  SignInWidgetClass({ this.toggleViewParam });

  @override
  _SignInWidgetClassState createState() => _SignInWidgetClassState();
}

class _SignInWidgetClassState extends State<SignInWidgetClass> {

  final AuthServiceClass _auth = AuthServiceClass();
  final _formKey = GlobalKey<FormState>();

  // text field statefulWidget
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to Budget Planner'),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleViewParam();
          },
          icon: Icon(Icons.person),
          label: Text('Sign Up'),
          )
        ],
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Sign in'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print('sign_in.dart valid');
                    dynamic result = await _auth.signInWithEmailPassword(email, password);
                    if(result == null) {
                      setState(() => error = 'Could not sign in');
                    }
                  }
                },
              ),
              Text(
                error
              ),
            ],
          ),
        ),
      ),
    );
  }
}
