import 'package:flutter/material.dart';
import 'package:project/main.dart';

class Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: RaisedButton(
          elevation: 0.0,
          color: Colors.white,
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyApp())),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        //backgroundColor: Colors.white,
        title: Text(
          "Expense",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
