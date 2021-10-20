import 'package:flutter/foundation.dart';

class Transaction {
  late int id;
  late String title;
  late int amount;
  late DateTime dateTime;
  static int increment = 0;

  Transaction(@required String title,@required int amount,@required DateTime dateTime){
    this.id = increment++;
    this.title = title;
    this.amount = amount;
    this.dateTime = dateTime;
    this.title = title;
  }
}
