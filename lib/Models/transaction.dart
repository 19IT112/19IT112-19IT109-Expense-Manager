import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transaction {
  String id;
  String label;
  DateTime dateTime;
  String amount;
  Icon icons;

  Transaction({
    this.id,
    this.amount,
    this.dateTime,
    this.label,
    this.icons,
  });
}
