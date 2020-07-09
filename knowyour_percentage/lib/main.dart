import 'package:flutter/material.dart';

import 'LandingPage.dart';

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
        primaryColor: Color(0XFF32e0c4),
        scaffoldBackgroundColor: Color(0XFF222831),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LandingPage(),
      },
    );
  }
}
