import 'package:expense_manager/Models/transaction.dart' as td;
import 'package:expense_manager/Widgets/newTransaction.dart';
import 'package:expense_manager/services/SignIn.dart';
import 'package:expense_manager/services/authentication.dart';
import 'package:flutter/material.dart';
import 'allMoths.dart';
import 'firstCard.dart';
import 'secondCard.dart';
import 'transactionList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<td.Transaction> _userTransaction = [];

  void _addTransaction(
      String label, double amount, DateTime dateTime, Image icon) {
    var addTx = td.Transaction(
      label: label,
      amount: double.parse(amount.toString()),
      dateTime: dateTime,
      icons: icon,
      id: "1",
    );

    setState(() {
      _userTransaction.add(addTx);
    });
  }

  void _addNewTransactionModel(BuildContext ctx) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewTransaction(_addTransaction, _userTransaction),
      ),
    );
  }

  bool _isSigningOut = false;
  Future<void> signOut(bool _signOut) async {
    setState(() {
      _signOut = true;
    });
    await Authentication.signOut(context: context);
    setState(() {
      _signOut = false;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SignIn(),
      ),
    );
    print("Sign out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => signOut(_isSigningOut),
          ),
        ],
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "DashBoard",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstCard(_userTransaction),
            AllMonths(_userTransaction),
            SecondCard(_userTransaction),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewTransactionModel(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
