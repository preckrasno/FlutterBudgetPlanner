import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData() async {
    return await userCollection.doc(uid).set({
      'balances' : [
        {
          'balance' : 0,
          'date' : ''
        }
      ],
      'goals' : [
        {
          'goal' : 0,
          'date' : ''
        }
      ],
      'incomes' : [
        {
          'income' : 0,
          'date' : ''
        }
      ],
      'spendings' : [
        {
          'spending' : 0,
          'date' : ''
        }
      ]
    });
  }

  //get users stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }

}