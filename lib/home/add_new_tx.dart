import 'package:flutter/material.dart';

import 'package:my_expenses/utils/colors.dart';

class AddNewTx extends StatefulWidget {
  final Function addTx;


  AddNewTx({
    required this.addTx,
  });

  @override
  State<AddNewTx> createState() => _AddNewTxState();
}

class _AddNewTxState extends State<AddNewTx> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

  Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitData(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: _submitData,
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    ));
  }
}
