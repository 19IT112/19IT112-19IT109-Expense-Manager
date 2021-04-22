import 'package:expense_manager/Models/transaction.dart';
import 'package:expense_manager/View_Pages/pages.dart';
import 'package:flutter/material.dart';

class AllMonths extends StatelessWidget {
  final List<Transaction> transaction;

  AllMonths(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12, bottom: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "April 2021",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context)
                .pushNamed(Pages.routeName, arguments: transaction),
            child: Text(
              "All Months",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
