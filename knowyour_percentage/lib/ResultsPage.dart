import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomButton.dart';
import 'constants.dart';

class Results extends StatelessWidget {
  Results({this.marklist});
  final List<num> marklist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: back_light,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Your results :",
                  style: GoogleFonts.kanit(fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  average(marklist).toString(),
                  style: GoogleFonts.kanit(fontSize: 35),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
          CustomButton(
            label: 'Back',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

num average(List<num> nums) {
  return nums.reduce((num a, num b) => a + b) / nums.length;
}
