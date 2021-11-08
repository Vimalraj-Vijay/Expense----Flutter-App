import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_expenses/utils/colors.dart';
import 'package:my_expenses/utils/strings.dart';

import 'model/transcation_model.dart';

class TransationList extends StatelessWidget {
  final List<TranscationModel> transation;

  const TransationList({
    Key? key,
    required this.transation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: expenseBorderColor,
                    width: 1.5,
                  )),
                  child: Text(
                    '$appCurrency${transation[index].amount.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: expenseTextColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        transation[index].title,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(DateFormat.yMMMd().format(transation[index].dateTime),
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transation.length,
      ),
    );
  }
}
