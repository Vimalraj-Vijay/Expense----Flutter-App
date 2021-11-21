import 'package:flutter/cupertino.dart';
import 'home/home.dart';
import 'splash.dart';

class Routes {
  static Map<String, WidgetBuilder> initRoutes() {
    return {
      Splash.id: (BuildContext ctx) => Splash(),
      MyHomePage.id: (BuildContext ctx) => MyHomePage()
    };
  }
}
