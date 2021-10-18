import 'package:flutter/foundation.dart';

class Transaction {
  int id;
  String title;
  int amount;
  DateTime dateTime;

  Transaction(@required this.id, @required this.title, @required this.amount, @required this.dateTime);
}
