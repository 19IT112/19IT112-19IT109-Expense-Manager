import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pages extends StatelessWidget {
  // final List<Transaction> transaction;

  // Pages(this.transaction);
  static const routeName = '/Pages';

  @override
  Widget build(BuildContext context) {
    final transaction = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //backgroundColor: Colors.white,
        title: Text(
          "Expense",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: transaction.map((e) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: e.icons,
              title: Text(
                e.label,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(DateFormat().add_MMMMEEEEd().format(e.dateTime)),
              trailing: Text(
                "\u{20B9}${e.amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
