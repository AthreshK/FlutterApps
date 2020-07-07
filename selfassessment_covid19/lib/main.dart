import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Test_brain.dart';

void main() => runApp(WhatToDo());

class WhatToDo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Self Assessment Covid-19',
      theme: ThemeData.dark(),
      home: TestPages(),
    );
  }
}

CovTest brain = new CovTest();

class TestPages extends StatefulWidget {
  _TestPagesState createState() => _TestPagesState();
}

class _TestPagesState extends State<TestPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(brain.getStory(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(fontSize: 30)),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      brain.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(brain.getChoice1(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(fontSize: 30)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: brain.buttonVisible(),
                child: Expanded(
                  flex: 2,
                  child: FlatButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        setState(() {
                          brain.nextStory(2);
                        });
                      },
                      color: Colors.blue,
                      child: Text(brain.getChoice2(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oswald(fontSize: 30))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
