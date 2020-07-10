import 'package:flutter/material.dart';
import 'package:knowyour_percentage/screens/Calculator.dart';
import 'package:knowyour_percentage/screens/LandingPage.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: accent_color,
        scaffoldBackgroundColor: back_dark,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LandingPage(),
        '/Calculator': (context) => Calculator(),
      },
    );
  }
}
