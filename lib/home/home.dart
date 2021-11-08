import 'package:flutter/material.dart';
import 'package:my_expenses/home/user_tx.dart';

class MyHomePage extends StatelessWidget {
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
            UserTx()
          ],
        ),
    );
  }
}
