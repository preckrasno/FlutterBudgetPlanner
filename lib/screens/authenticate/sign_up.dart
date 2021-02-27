import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/services/auth.dart';
import 'package:flutter_budget_planner/shared/loading.dart';

class SignUpWidgetClass extends StatefulWidget {
  final Function toggleViewParam;
  SignUpWidgetClass({this.toggleViewParam});

  @override
  _SignUpWidgetClassState createState() => _SignUpWidgetClassState();
}

class _SignUpWidgetClassState extends State<SignUpWidgetClass> {
  final AuthServiceClass _auth = AuthServiceClass();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _passwordVisible = false;

  // text field statefulWidget
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingWidget()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign up to Budget Planner'),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleViewParam();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sing In'),
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
                        labelText: 'Email',
                        hintText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: [AutofillHints.email],
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
                        labelText: 'Password',
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      enableSuggestions: false,
                      autofillHints: [AutofillHints.newPassword],
                      autocorrect: false,
                      obscureText: !_passwordVisible,
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      child: Text('Sign up'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          dynamic result = await _auth
                              .registerWithEmailPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'please supply a valid email';
                              isLoading = false;
                            });
                          }
                        }
                      },
                    ),
                    Text(error),
                  ],
                ),
              ),
            ),
          );
  }
}
