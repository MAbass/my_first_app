import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function _deleteTransactions;

  TransactionList(this.transactions, this._deleteTransactions);

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
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child: Text("${transactions[index].amount} Fcfa")),
                      ),
                    ),
                    title: Text(
                      '${transactions[index].title}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                        "${DateFormat.yMMMMd().format(transactions[index].dateTime)}"),
                    trailing: IconButton(
                      onPressed: () => _deleteTransactions(transactions[index].id),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
          );
  }
}
