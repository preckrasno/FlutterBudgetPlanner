import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/services/auth.dart';

class HomeWidgetClass extends StatelessWidget {
  final AuthServiceClass _auth = AuthServiceClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Planner'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOutFunction();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'))
        ],
      ),
    );
  }
}
