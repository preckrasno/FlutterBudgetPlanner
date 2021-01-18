import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/screens/authenticate/authenticate.dart';
import 'package:flutter_budget_planner/screens/home/home.dart';

class WrapperWidgetClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget
    return AuthenticateWidgetClass();
  }
}
