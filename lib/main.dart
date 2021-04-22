import 'package:expense_manager/View_Pages/pages.dart';
import 'package:expense_manager/Widgets/newTransaction.dart';
import 'package:expense_manager/Widgets/transactionList.dart';
import 'package:expense_manager/services/SignIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
    );
  }
}
