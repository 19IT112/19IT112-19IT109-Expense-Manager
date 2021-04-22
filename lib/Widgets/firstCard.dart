import 'package:expense_manager/Models/transaction.dart' as td;
import 'package:flutter/material.dart';

import '../View_Pages/pages.dart';

class FirstCard extends StatelessWidget {
  final List<td.Transaction> transaction;

  FirstCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    double sum = transaction.fold(
        0, (previousValue, element) => previousValue + element.amount);

    sum = double.parse(sum.toStringAsFixed(2));

    void changePage() {
      Navigator.of(context).pushNamed(
        Pages.routeName,
        arguments: transaction,
      );
    }

    return InkWell(
      onTap: changePage,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OverView",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 25,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Total expense",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "\u{20B9}$sum",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
