import 'package:flutter/material.dart';

import 'package:my_expenses/utils/colors.dart';

class AddNewTx extends StatelessWidget {
  final Function addTx;

  AddNewTx({
    required this.addTx,
  });

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: expenseTextColor,
              ),
              onPressed: () => {
                addTx(
                  titleController.text,
                  double.parse(
                    amountController.text,
                  ),
                )
              },
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    ));
  }
}
