import 'package:flutter/material.dart';
import 'package:flutter_budget_planner/models/user.dart';
import 'package:flutter_budget_planner/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_budget_planner/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass>.value(
      value: AuthServiceClass().user,
      child: MaterialApp(
        home: WrapperWidgetClass(),
      ),
    );
  }
}
