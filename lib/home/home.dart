import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  bool isSwitchOn = false;

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
    final mediaQuery = MediaQuery.of(context);
    bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    final dynamic appBarValue = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              "Personal Expenses",
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => startAddTx(context),
                )
              ],
            ),
          )
        : AppBar(
            title: const Text(
              "Personal Expenses",
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
          );
    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBarValue.preferredSize.height -
              mediaQuery.padding.top) *
          .7,
      child: TransationList(
          transation: transation, deleteTrancation: _deleteTranscation),
    );
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (isLandScape)
              Row(
                children: [
                  Text('Show Chart'),
                  Switch.adaptive(
                      value: isSwitchOn,
                      onChanged: (value) {
                        setState(() {
                          isSwitchOn = value;
                        });
                      }),
                ],
              ),
            if (!isLandScape)
              Container(
                height: (mediaQuery.size.height -
                        appBarValue.preferredSize.height -
                        mediaQuery.padding.top) *
                    .3,
                child: Chart(transcationValues: _recentTranscation),
              ),
            if (!isLandScape) txListWidget,
            if (isLandScape)
              isSwitchOn
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBarValue.preferredSize.height -
                              mediaQuery.padding.top) *
                          .7,
                      child: Chart(transcationValues: _recentTranscation),
                    )
                  : txListWidget,
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBarValue,
          )
        : Scaffold(
            appBar: appBarValue,
            body: pageBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => startAddTx(context),
                  ),
          );
  }
}
