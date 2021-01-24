import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/screens/authenticate/sign_in.dart';
import 'package:flutter_budget_planner/screens/authenticate/sign_up.dart';

class AuthenticateWidgetClass extends StatefulWidget {
  @override
  _AuthenticateWidgetClassState createState() =>
      _AuthenticateWidgetClassState();
}

class _AuthenticateWidgetClassState extends State<AuthenticateWidgetClass> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInWidgetClass(toggleViewParam: toggleView);
    } else {
      return SignUpWidgetClass(toggleViewParam: toggleView);
    }
  }
}
