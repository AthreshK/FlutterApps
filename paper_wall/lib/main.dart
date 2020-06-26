import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PaperWall());
}

class PaperWall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _images = [
      "https://wallpapercave.com/wp/wp5129071.jpg",
      "https://i.redd.it/xgd5klircz911.jpg",
      "https://wallpapercave.com/wp/wp5129073.jpg",
      "images/ghost-in-the-shell-wallpaper-1080×1920.jpg",
      "images/6bb6d48de427d6a2bf798be5efac6a17.jpg"
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Center(child: Text('Some cool wallpapers')),
          backgroundColor: Colors.cyanAccent[700],
          elevation: 2,
        ),
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 9 / 16,
                viewportFraction: 0.8,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayInterval: Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn),
            items: _images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  if (_images.indexOf(i) < 3) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: new Column(
                          children: <Widget>[
                            new GestureDetector(
                                child: Image.network(
                              i,
                              fit: BoxFit.fill,
                            )),
                            Text(
                              "Loaded from Web",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ],
                        ));
                  } else {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: new Column(
                          children: <Widget>[
                            new GestureDetector(
                                child: Image.asset(
                              i,
                              fit: BoxFit.fill,
                            )),
                            Text(
                              "Loaded from Assets",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ],
                        ));
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
