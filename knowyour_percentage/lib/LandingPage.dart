import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Welcome',
            style: GoogleFonts.kanit(fontSize: 30, color: back_dark),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomButton(
            label: 'Calculate My CGPA',
          ),
          CustomButton(
            label: 'Calculate My GPA',
          ),
          CustomButton(
            label: 'Grade Improvement',
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;

  const CustomButton({@required this.label});

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30),
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: accent_color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.kanit(fontSize: 25, color: back_dark),
        ),
      ),
    );
  }
}
