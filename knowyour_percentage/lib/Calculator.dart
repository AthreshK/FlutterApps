import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowyour_percentage/CustomButton.dart';
import 'package:knowyour_percentage/ResultsPage.dart';

import 'BuildSubject.dart';
import 'constants.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

List<num> _mark = [50, 50, 50, 50, 50];
List<String> _subject = ['Math', 'Math', 'Math', 'Math', 'Math'];

class _CalculatorState extends State<Calculator> {
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
                'Percentage\nCalculation',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: 35,
                  color: back_dark,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BuildSubject(
                  marks: _mark[0],
                  subject: _subject[0],
                  marksFun: mark1Fun,
                  subFun: sub1Fun),
              BuildSubject(
                  marks: _mark[1],
                  subject: _subject[1],
                  marksFun: mark2Fun,
                  subFun: sub2Fun),
              BuildSubject(
                  marks: _mark[2],
                  subject: _subject[2],
                  marksFun: mark3Fun,
                  subFun: sub3Fun),
              BuildSubject(
                  marks: _mark[3],
                  subject: _subject[3],
                  marksFun: mark4Fun,
                  subFun: sub4Fun),
              BuildSubject(
                  marks: _mark[4],
                  subject: _subject[4],
                  marksFun: mark5Fun,
                  subFun: sub5Fun)
            ],
          ),
          CustomButton(
            label: 'Calculate',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Results(
                          marklist: _mark,
                        )),
              );
            },
          )
        ],
      ),
    );
  }

  void sub1Fun(sub) {
    setState(() {
      _subject[0] = sub;
    });
  }

  void mark1Fun(num) {
    setState(() {
      _mark[0] = num;
    });
  }

  void sub2Fun(sub) {
    setState(() {
      _subject[1] = sub;
    });
  }

  void mark2Fun(num) {
    setState(() {
      _mark[1] = num;
    });
  }

  void sub3Fun(sub) {
    setState(() {
      _subject[2] = sub;
    });
  }

  void mark3Fun(num) {
    setState(() {
      _mark[2] = num;
    });
  }

  void sub4Fun(sub) {
    setState(() {
      _subject[3] = sub;
    });
  }

  void mark4Fun(num) {
    setState(() {
      _mark[3] = num;
    });
  }

  void sub5Fun(sub) {
    setState(() {
      _subject[4] = sub;
    });
  }

  void mark5Fun(num) {
    setState(() {
      _mark[4] = num;
    });
  }
}
