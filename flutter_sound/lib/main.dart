import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioPlayer;
  String durasi = "00:00:00";

  _MyAppState() {
    audioPlayer = AudioPlayer();
    audioPlayer.onAudioPositionChanged.listen((duration) {
      setState(() {
        durasi = duration.toString();
      });
    });
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  void playSound(String url) async {
    await audioPlayer.seek(Duration(seconds: 30)); //untuk memulai lagu dari detik yg berbeda
    await audioPlayer.play(url);
  }

  void pauseSound() async {
    await audioPlayer.pause();
  }

  void stopSound() async {
    await audioPlayer.stop();
  }

  void resumeSound() async {
    audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Playing Music"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  playSound(
                      "http://23.237.126.42/ost/top-gear-2-sega-genesis/yzcalloe/01_Title%20Theme.mp3");
                },
                child: Text("Play"),
              ),
              RaisedButton(
                onPressed: () {
                  pauseSound();
                },
                child: Text("Pause"),
              ),
              RaisedButton(
                onPressed: () {
                  stopSound();
                },
                child: Text("Stop"),
              ),
              RaisedButton(
                onPressed: () {
                  resumeSound();
                },
                child: Text("Resume"),
              ),
              Text(
                durasi,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
