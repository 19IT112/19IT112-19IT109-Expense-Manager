import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/Widgets/newTransaction.dart';
import 'package:project/Widgets/transactionList.dart';
import 'Models/transaction.dart';
import 'Widgets/allMoths.dart';
import 'Widgets/firstCard.dart';
import 'Widgets/secondCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: "1",
    //   label: "shoes",
    //   amount: "${200}",
    //   icons: Icon(
    //     Icons.shopping_cart_sharp,
    //     color: Colors.red,
    //     size: 40,
    //   ),
    //   dateTime: DateTime.now(),
    // ),
    // Transaction(
    //   id: "2",
    //   label: "Drinks",
    //   amount: "${1500}",
    //   icons: Icon(
    //     Icons.no_drinks,
    //     color: Colors.red,
    //     size: 40,
    //   ),
    //   dateTime: DateTime.now(),
    // ),
    // Transaction(
    //   id: "2",
    //   label: "breakfast",
    //   amount: "${1500}",
    //   icons: Icon(
    //     Icons.free_breakfast,
    //     color: Colors.red,
    //     size: 40,
    //   ),
    //   dateTime: DateTime.now(),
    // ),
  ];

  void _addTransaction(String label, double amount) {
    var addTx = Transaction(
      label: label,
      amount: amount.toString(),
      dateTime: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(addTx);
    });
  }

  void _addNewTransactionModel(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addNewTransactionModel(context),
          ),
        ],
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "DashBroad",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstCard(),
            AllMonths(),
            SecondCard(),
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
