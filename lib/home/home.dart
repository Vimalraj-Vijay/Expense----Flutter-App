import 'package:flutter/material.dart';
import 'package:my_expenses/home/expense_view.dart';

import 'model/transcation_model.dart';

class MyHomePage extends StatelessWidget {
  final List<TranscationModel> transcationModel = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Card(
            child: Text("Chart"),
          ),
          ExpenseView(
            transation: transcationModel,
          )
        ],
      ),
    );
  }
}
