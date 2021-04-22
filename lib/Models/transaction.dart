import 'package:flutter/cupertino.dart';

class Transaction {
  String id;
  String label;
  DateTime dateTime;
  double amount;
  Image icons;

  Transaction({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.label,
    required this.icons,
  });
}
