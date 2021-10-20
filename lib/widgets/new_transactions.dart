import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  // String titleInput = "";
  // String amountTitle = "";

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(titleController.text, amountController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              // onSubmitted: (_) => submitData(),
              //onChanged: (value) {titleInput = value;},
            ),
            TextField(
              decoration: InputDecoration(labelText: "Price"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {amountTitle = value;}
            ),
            TextButton(
                onPressed: () => submitData,
                child: Text("Add transaction"),
                style: TextButton.styleFrom(
                    primary: Colors.green, padding: EdgeInsets.all(10)))
          ],
        ),
      ),
    );
  }
}
