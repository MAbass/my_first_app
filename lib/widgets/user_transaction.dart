import 'package:flutter/cupertino.dart';
import 'package:my_first_app/models/transaction.dart';
import 'package:my_first_app/widgets/transaction_list.dart';

import 'new_transactions.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(1, 'New shoes', 3000, new DateTime(2021, 10, 13)),
    Transaction(1, 'New pen', 500, new DateTime(2021, 10, 13)),
    Transaction(1, 'New clothes', 3000, new DateTime(2021, 10, 12)),
  ];

  void _addNewTransaction(String title, String amount) {
    Transaction transaction =
        new Transaction(2, title, int.parse(amount), DateTime.now());
    setState(() {
      _userTransactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
