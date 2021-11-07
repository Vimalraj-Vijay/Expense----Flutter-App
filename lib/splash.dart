import 'package:flutter/material.dart';
import 'package:my_expenses/colors.dart';
import 'package:my_expenses/main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Image(
              image: AssetImage('images/app_logo.png'),
              height: 200,
              width: 200,
            ),
          ),
          Center(
            child: Text(
              'Expense',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(
      const Duration(
        milliseconds: 2500,
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(title: "Expense"),
      ),
    );
  }
}
