import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_text_button/icon_text_button.dart';

void main() {
  runApp(BikeApp());
}

class BikeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BikeSounds',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Indian Bike Sounds",
              style: GoogleFonts.bangers(fontSize: 30, letterSpacing: 3),
            ),
          ),
          backgroundColor: Color.fromRGBO(43, 144, 217, 1),
        ),
        body: BikeSounds(),
        backgroundColor: Color.fromRGBO(155, 174, 200, 1),
      ),
    );
  }
}

class BikeSounds extends StatefulWidget {
  @override
  _BikeSoundsState createState() => _BikeSoundsState();
}

class _BikeSoundsState extends State<BikeSounds> {
  int bikeNum = 5;
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            assetsAudioPlayer.open(
              Audio("assets/Bike_$bikeNum.mp3"),
            );
          },
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Color.fromRGBO(155, 174, 200, 1),
                      blurRadius: 20.0, // soften the shadow
                      spreadRadius: 3.0, //extend the shadow
                    )
                  ],
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: AssetImage('images/Bike_$bikeNum.JPG'),
                      fit: BoxFit.fill),
                ),
              ),
              Text("Tap on bike !",
                  style: GoogleFonts.bangers(
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 3,
                  ))
            ],
          ),
        ),
        IconTextButton(
          icon: Icon(FlutterIcons.cogs_faw),
          label: Text(
            "Generate Bike ",
            style: GoogleFonts.bangers(
              fontSize: 30,
            ),
          ),
          color: Colors.white,
          bgColor: Color.fromRGBO(43, 144, 217, 1),
          onPress: () {
            setState(() {
              bikeNum = Random().nextInt(10) + 1;
              assetsAudioPlayer.stop();
            });
          },
        )
      ],
    );
  }
}
