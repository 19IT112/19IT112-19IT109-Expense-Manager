import 'package:expense_manager/Models/transaction.dart' as td;
import 'package:flutter/material.dart';

class SecondCard extends StatelessWidget {
  final List<td.Transaction> transaction;

  SecondCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    double monthSum = transaction.fold(
        0, (previousValue, element) => previousValue + element.amount);
    monthSum = double.parse(monthSum.toStringAsFixed(2));

    double dailysum = transaction.fold(
        0, (previousValue, element) => previousValue + element.amount);

    dailysum = (dailysum / 31);
    dailysum = double.parse(dailysum.toStringAsFixed(2));

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: EdgeInsets.only(right: 12, left: 12),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Monthly Average",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Daily Expense",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Monthly Flow",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\u{20B9}$dailysum",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "\u{20B9}$monthSum",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
