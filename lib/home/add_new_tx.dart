import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/utils/strings.dart';

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
  var _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty ||
        amountController.text.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
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
          Container(
            padding: EdgeInsets.only(top: 15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDate == null
                    ? noDateChoose
                    : DateFormat.yMMMd().format(_selectedDate)),
                ElevatedButton(
                    onPressed: _presentDatePicker,
                    child: Text(chooseDate),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
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
