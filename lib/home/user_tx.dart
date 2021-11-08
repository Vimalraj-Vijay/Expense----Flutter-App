import 'package:flutter/material.dart';
import 'package:my_expenses/home/add_new_tx.dart';
import 'package:my_expenses/home/transation_list.dart';

import 'model/transcation_model.dart';

class UserTx extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserTxState();
}

class UserTxState extends State<UserTx> {
  final List<TranscationModel> transation = [
    TranscationModel(
      id: 'v1',
      title: "Dress",
      amount: 85.22,
      dateTime: DateTime.now(),
    ),
    TranscationModel(
      id: 'v2',
      title: "Food",
      amount: 125.00,
      dateTime: DateTime.now(),
    ),
    TranscationModel(
      id: 'v3',
      title: "Bike",
      amount: 1500.96,
      dateTime: DateTime.now(),
    ),
    TranscationModel(
      id: 'v4',
      title: "Party",
      amount: 8500.45,
      dateTime: DateTime.now(),
    ),
  ];

  void _addTranscations(String title, double amount) {
    final newTx = TranscationModel(
      title: title,
      amount: amount,
      id: DateTime.now().toString(),
      dateTime: DateTime.now(),
    );

    setState(() {
      transation.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddNewTx(addTx: _addTranscations),
        TransationList(
          transation: transation,
        ),
      ],
    );
  }
}
