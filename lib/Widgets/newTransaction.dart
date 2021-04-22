import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Models/transaction.dart' as td;
import 'package:expense_manager/Widgets/Category.dart';
import 'package:expense_manager/services/authentication.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  final List<td.Transaction> userTransaction;
  NewTransaction(this.addTx, this.userTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  late Image icon;
  DateTime _dateTime = DateTime.now();
  final labelController = TextEditingController();
  final amountController = TextEditingController();
  final valueController = TextEditingController();

  void _submitData() {
    final enterlabel = labelController.text;
    final enteramount = double.parse(amountController.text);

    if (enterlabel.isEmpty || enteramount <= 0) {
      return;
    }

    widget.addTx(enterlabel, enteramount, _dateTime, icon);
    Navigator.of(context).pop();
  }

  Future datePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Transaction"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Limit"),
                controller: valueController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Title"),
                controller: labelController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Amount"),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: Text(
                      "Select Date",
                    ),
                    onPressed: () {
                      datePicker(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      "SelectCategory",
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Category(selecticon: (value) {
                            setState(() {
                              icon = value;
                            });
                          }),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: Text("Add Transaction"),
                    onPressed: () async {
                      double total = widget.userTransaction.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.amount);

                      if (double.parse(amountController.text) > 500) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Please enter amount less than your limit",
                              ),
                            );
                          },
                        );
                      }
                      _submitData();
                      final db = FirebaseFirestore.instance;
                      final uid = Authentication.getCurrentUID();
                      await db
                          .collection("userData")
                          .doc(uid)
                          .collection("Transaction")
                          .add({
                        "title": labelController.text,
                        "amount": double.parse(amountController.text),
                        "Date": _dateTime,
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
