import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  // String titleInput = "";
  // String amountTitle = "";

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate = null;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(_titleController.text, _amountController.text);
    Navigator.of(context).pop();
  }

  void _showDatePickerOnPressed() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2024))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
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
              controller: _titleController,
              // onSubmitted: (_) => submitData(),
              //onChanged: (value) {titleInput = value;},
            ),
            TextField(
              decoration: InputDecoration(labelText: "Price"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) {amountTitle = value;}
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? "No date choosen"
                      : "${DateFormat.yMMMMd().format(selectedDate!)}",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                    onPressed: _showDatePickerOnPressed,
                    child: Text(
                      "Choose date",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
            TextButton(
                onPressed: () => _submitData,
                child: Text("Add transaction"),
                style: TextButton.styleFrom(
                    primary: Colors.green, padding: EdgeInsets.all(10))
            )
          ],
        ),
      ),
    );
  }
}
