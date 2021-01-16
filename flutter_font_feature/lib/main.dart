import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Typography"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Contoh 01 (Tanpa apapun)",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Contoh 02 (Small Caps)",
              style: TextStyle(fontSize: 20, fontFeatures: [
                FontFeature.enable('smcp'),
                FontFeature.enable('frac')
              ]),
            ),
            Text(
              "Contoh 03 1/2 (Small Caps & Frac)",
              style: TextStyle(fontSize: 20, fontFeatures: [
                FontFeature.enable('smcp'),
                FontFeature.enable('frac')
              ]),
            )
          ],
        )),
      ),
    );
  }
}
