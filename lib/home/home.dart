import 'package:flutter/material.dart';
import 'package:my_expenses/home/add_new_tx.dart';
import 'model/transcation_model.dart';
import 'transation_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TranscationModel> transation = [
    /* TranscationModel(
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
    ), */
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

  void startAddTx(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AddNewTx(addTx: _addTranscations);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(
            fontFamily: 'QuickSands',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => startAddTx(context),
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Text("Chart"),
            ),
            TransationList(
              transation: transation,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddTx(context),
      ),
    );
  }
}
