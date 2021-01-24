import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/screens/authenticate/sign_in.dart';
import 'package:flutter_budget_planner/screens/authenticate/sign_up.dart';

class AuthenticateWidgetClass extends StatefulWidget {
  @override
  _AuthenticateWidgetClassState createState() =>
      _AuthenticateWidgetClassState();
}

class _AuthenticateWidgetClassState extends State<AuthenticateWidgetClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignUpWidgetClass(),
    );
  }
}
