import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  // String titleInput = "";
  // String amountTitle = "";
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);

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
              //onChanged: (value) {titleInput = value;},
            ),
            TextField(
              decoration: InputDecoration(labelText: "Price"),
              controller: amountController,

              // onChanged: (value) {amountTitle = value;}
            ),
            FlatButton(
              onPressed: () {
                addTx(titleController.text, amountController.text);
              },
              child: Text("Add transaction"),
              textColor: Colors.purple,
              padding: EdgeInsets.all(5),
            )
          ],
        ),
      ),
    );
  }
}
