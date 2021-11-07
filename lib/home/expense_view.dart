import 'package:flutter/material.dart';
import 'package:my_expenses/utils/colors.dart';

import 'model/transcation_model.dart';

class ExpenseView extends StatelessWidget {
  final List<TranscationModel> transation;

  const ExpenseView({
    Key? key,
    required this.transation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transation.map(
        (tx) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: expenseBorderColor,
                    width: 1.5,
                  )),
                  child: Text(
                    tx.amount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: expenseTextColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        tx.title,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(tx.dateTime.toString(),
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
