import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/models/user.dart';
import 'package:flutter_budget_planner/screens/authenticate/authenticate.dart';
import 'package:flutter_budget_planner/screens/home/home.dart';
import 'package:provider/provider.dart';

class WrapperWidgetClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    print('wrapper.dart WrapperWidgetClass user = "$user"');

    //return either Home or Authenticate widget
    if (user == null) {
      return AuthenticateWidgetClass();
    } else {
      return HomeWidgetClass();
    }
  }
}
