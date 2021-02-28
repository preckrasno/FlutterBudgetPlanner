import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserInfoList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserInfoList> {



  @override
  Widget build(BuildContext context) {

    final users = Provider.of<QuerySnapshot>(context);
    print(users);

    return Container(
      
    );
  }
}