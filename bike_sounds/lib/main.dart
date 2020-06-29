import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(BikeApp());
}

class BikeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BikeSounds',
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Bike sounds app !"))),
        body: BikeSounds(),
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
          child: Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                //background color of box
                BoxShadow(
                  color: Colors.grey[500],
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
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              assetsAudioPlayer.stop();
              bikeNum = Random().nextInt(10) + 1;
            });
          },
          child: Text('Generate Bike ! '),
        )
      ],
    );
  }
}
