import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/chart.dart';
import 'package:my_first_app/widgets/new_transactions.dart';
import 'package:my_first_app/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction('New shoes', 3000, new DateTime(2021, 10, 18)),
    Transaction('New pen', 500, new DateTime(2021, 10, 18)),
    Transaction('New clothes', 400, new DateTime(2021, 10, 18)),
    Transaction('New clothes', 4100, new DateTime(2021, 06, 05)),
    Transaction('New clothes', 1350, new DateTime(2021, 10, 10)),
    Transaction('New clothes', 900, new DateTime(2021, 10, 01)),
  ];

  void startAddNewTransaction() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _addNewTransaction(String title, String amount) {
    Transaction transaction =
        new Transaction(title, int.parse(amount), DateTime.now());
    setState(() {
      _userTransactions.add(transaction);
    });
  }
  void _deleteTransactions(int id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: startAddNewTransaction,
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ChartWidget(_userTransactions),
            TransactionList(_userTransactions, _deleteTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startAddNewTransaction,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
