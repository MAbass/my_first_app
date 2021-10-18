import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transactions
          .map((transaction) => Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      width: 100,
                      child: Text(
                        "${transaction.amount} Fcfa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                            new DateFormat('yyyy-mm-dd')
                                .format(transaction.dateTime),
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15))
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
