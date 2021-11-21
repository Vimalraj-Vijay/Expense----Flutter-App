import 'package:flutter/material.dart';
import 'package:my_expenses/home/add_new_tx.dart';
import 'package:my_expenses/home/chart/chart.dart';
import 'model/transcation_model.dart';
import 'transation_list.dart';

class MyHomePage extends StatefulWidget {
static var id = "/homePage"; 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TranscationModel> transation = [];

  List<TranscationModel> get _recentTranscation {
    return transation.where((element) {
      return element.dateTime.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addTranscations(String title, double amount, DateTime selectedDate) {
    final newTx = TranscationModel(
      title: title,
      amount: amount,
      id: DateTime.now().toString(),
      dateTime: selectedDate,
    );

    setState(() {
      transation.add(newTx);
    });
  }

  void _deleteTranscation(String id) {
    setState(() {
      transation.removeWhere((element) => element.id == id);
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
            Chart(transcationValues: _recentTranscation),
            TransationList(
                transation: transation, deleteTrancation: _deleteTranscation),
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
