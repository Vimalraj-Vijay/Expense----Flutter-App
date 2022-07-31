import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/home/chart/chart_bar.dart';

import 'package:my_expenses/home/model/transcation_model.dart';

class Chart extends StatelessWidget {
  final List<TranscationModel> transcationValues;
  const Chart({
    Key? key,
    required this.transcationValues,
  }) : super(key: key);

  List<Map<String, Object>> get getTrancationsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      var totalSum = 0.0;

      for (var i = 0; i < transcationValues.length; i++) {
        if (transcationValues[i].dateTime.day == weekDay.day &&
            transcationValues[i].dateTime.month == weekDay.month &&
            transcationValues[i].dateTime.year == weekDay.year) {
          totalSum += transcationValues[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return transcationValues.fold(0.0, (previousValue, element) {
      return previousValue + element.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getTrancationsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'].toString(),
                spendAmount: double.parse(data['amount'].toString()),
                spendingTotalPercent: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
