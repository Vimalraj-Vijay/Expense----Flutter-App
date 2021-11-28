import 'package:flutter/material.dart';
import 'package:my_expenses/utils/colors.dart';
import 'package:my_expenses/utils/strings.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendedAmout;
  final double spendingTotalPercent;

  const ChartBar({
    Key? key,
    required this.label,
    required this.spendedAmout,
    required this.spendingTotalPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * .15,
              child: FittedBox(
                child: Text("$appCurrency ${spendedAmout.toStringAsFixed(0)}"),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: greyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingTotalPercent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .15,
              child: FittedBox(
                child: Text(label ),
              ),
            ),
          ],
        );
      },
    );
  }
}
