import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: [
              Text("No Transaction yet!"),
              Image.asset("assets/images/NoTran.png"),
            ],
          )
        : Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            margin: EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: transaction.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: e.icons,
                          title: Text(
                            e.label,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(
                              DateFormat().add_MMMMEEEEd().format(e.dateTime)),
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
                ],
              ),
            ),
          );
  }
}
