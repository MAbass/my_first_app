import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text("No transactions added yet!!"),
              Container(
                margin: EdgeInsets.all(20),
                  child: Image.asset(
                "assets/images/waiting.png",
                fit: BoxFit.cover,
                width: 300,
              ))
            ],
          )
        : Container(
            height: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
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
                          "${transactions[index].amount} Fcfa",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${transactions[index].title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                              new DateFormat('yyyy-mm-dd')
                                  .format(transactions[index].dateTime),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15))
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
          );
  }
}
