import 'package:flutter/material.dart';

import 'Calculator.dart';
import 'LandingPage.dart';
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
