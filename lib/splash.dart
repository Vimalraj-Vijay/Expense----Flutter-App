import 'package:flutter/material.dart';
import 'package:my_expenses/home/home.dart';
import 'package:my_expenses/utils/colors.dart';

class Splash extends StatefulWidget {
  static var id = "/splash";
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
              image: AssetImage('assests/images/app_logo.png'),
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
    Navigator.pushReplacementNamed(context, MyHomePage.id);
  }
}
