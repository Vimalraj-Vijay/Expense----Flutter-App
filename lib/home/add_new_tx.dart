import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/utils/strings.dart';

class AddNewTx extends StatefulWidget {
  final Function addTx;

  const AddNewTx({
    Key? key,
    required this.addTx,
  }) : super(key: key);

  @override
  State<AddNewTx> createState() => _AddNewTxState();
}

class _AddNewTxState extends State<AddNewTx> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  dynamic _selectedDate;

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
    return SingleChildScrollView(
      child: Card(
          child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? noDateChoose
                      : DateFormat.yMMMd().format(_selectedDate)),
                  Platform.isIOS
                      ? CupertinoButton(
                          onPressed: _presentDatePicker,
                          child: const Text(chooseDate),
                        )
                      : ElevatedButton(
                          onPressed: _presentDatePicker,
                          child: const Text(chooseDate),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Platform.isIOS
                  ? CupertinoButton(
                      onPressed: _submitData,
                      child: const Text("Submit"),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: _submitData,
                      child: const Text("Submit"),
                    ),
            ),
          ],
        ),
      )),
    );
  }
}
