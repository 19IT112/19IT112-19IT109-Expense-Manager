import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    final uid = Authentication.getCurrentUID();
    final collection = FirebaseFirestore.instance
        .collection("userData")
        .doc(uid)
        .collection("Transaction")
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text("ksdnfkjsndf"),
      ),
      body: StreamBuilder(
        stream: collection,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final item = snapshot.data?.docs.length;
          return ListView.builder(
            itemCount: item,
            itemBuilder: (context, index) {
              final data = snapshot.data?.docs[index];
              return snapshot.data != null
                  ? ListTile(
                      title: Text(data?['title']),
                      subtitle: Text(DateFormat('dd/MM/yyyy')
                          .format(data?['Date'].toDate())),
                      trailing: Text(data?['amount']),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          );
        },
      ),
    );
  }
}
