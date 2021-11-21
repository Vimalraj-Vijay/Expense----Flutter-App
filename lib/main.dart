import 'package:flutter/material.dart';
import 'package:my_expenses/routes.dart';
import 'package:my_expenses/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Open Sans',
      ),
      initialRoute: Splash.id,
      routes: Routes.initRoutes(),
    );
  }
}
