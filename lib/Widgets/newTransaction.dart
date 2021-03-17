import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final labelController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final enterlabel = labelController.text;
    final enteramount = double.parse(amountController.text);

    if (enterlabel.isEmpty || enteramount <= 0) {
      return;
    }

    widget.addTx(enterlabel, enteramount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
            FlatButton(
              onPressed: _submitData,
              child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
