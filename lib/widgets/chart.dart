import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_app/models/transaction.dart';
import 'package:my_first_app/widgets/chart_bar.dart';

class ChartWidget extends StatelessWidget {
  List<Transaction> transactions;

  ChartWidget(this.transactions);

  Map<String, int> groupedTransactionsValues() {
    var list_of_couple = {
      "Monday": 0,
      "Tuesday": 0,
      "Wednesday": 0,
      "Thursday": 0,
      "Friday": 0,
      "Saturday": 0,
      "Sunday": 0
    };
    for (int i = 0; i < this.transactions.length; i++) {
      String day = DateFormat('EEEE').format(transactions[i].dateTime);
      list_of_couple.keys.forEach((element) {
        if (element == day) {
          list_of_couple[element] =
              (list_of_couple[element] ?? 0) + transactions[i].amount;
        }
      });
    }
    return list_of_couple;
  }

  @override
  Widget build(BuildContext context) {
    var variable = groupedTransactionsValues();
    print(variable);
    return Container(
      color: Colors.red,
      height: 180,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues().entries.map((e) {
            var spendingAmount = e.value;
            var label = e.key;
            return ChartBar(label, spendingAmount);
          }).toList(),
        ),
      ),
    );
  }
}
