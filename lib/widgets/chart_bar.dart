import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int spendingAmount;
  final double totalSpendingAmount;

  ChartBar(this.label, this.spendingAmount, this.totalSpendingAmount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, contrainst) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
            child: Text(
              "${this.spendingAmount}",
              style: TextStyle(fontSize: 13),
            ),
          ),
          Container(
            height: contrainst.maxHeight*0.4,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: this.totalSpendingAmount,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          Text("${this.label[0]}"),
        ],
      );
    });
  }
}
