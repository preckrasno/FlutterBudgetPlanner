import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/screens/home/user_info_list.dart';
import 'package:flutter_budget_planner/services/auth.dart';
import 'package:flutter_budget_planner/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeWidgetClass extends StatelessWidget {
  final AuthServiceClass _auth = AuthServiceClass();
  

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().userInfo,
      child: Scaffold(
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
        body: UserInfoList(),
      ),
    );
  }
}
