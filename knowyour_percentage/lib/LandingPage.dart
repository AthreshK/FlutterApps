import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomButton.dart';
import 'constants.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(80),
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text(
                'Welcome',
                style: GoogleFonts.kanit(fontSize: 50, color: back_dark),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomButton(
            label: 'Calculate My Percentage',
            onTap: () {
              Navigator.pushNamed(context, '/Calculator');
            },
          ),
          CustomButton(
            label: 'Calculate My Marks',
          ),
        ],
      ),
    );
  }
}
