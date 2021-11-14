import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/home/empty_transcation.dart';

import 'package:my_expenses/utils/colors.dart';
import 'package:my_expenses/utils/strings.dart';

import 'model/transcation_model.dart';

class TransationList extends StatelessWidget {
  final List<TranscationModel> transation;
  final Function deleteTrancation;

  const TransationList({
    Key? key,
    required this.transation,
    required this.deleteTrancation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      child: transation.isEmpty
          ? EmptyTranscation()
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            '$appCurrency ${transation[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transation[index].title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(transation[index].dateTime),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTrancation(transation[index].id );
                      },
                    ),
                  ),
                );
              },
              itemCount: transation.length,
            ),
    );
  }
}
