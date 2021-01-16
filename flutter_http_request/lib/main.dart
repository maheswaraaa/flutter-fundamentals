import 'package:flutter/material.dart';
import 'package:flutter_http_request/post_result_model.dart';
import 'package:flutter_http_request/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;
  String output = "no data";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(output), // contoh multiple users
              // Text((user != null)
              //     ? user.id + " | " + user.name //+
              //     // " | " +
              //     // postResult.job +
              //     // " | " +
              //     // postResult.created
              //     : "Tidak ada data"),
              RaisedButton(
                  onPressed: () {
                    // PostResult.connectToAPI("Badu", "Dokter").then((value) {
                    //   postResult = value;
                    //   setState(() {});
                    // });

                    // User.connectToAPI("5").then((value) {
                    //   user = value;
                    //   setState(() {});
                    // });

                    User.getUsers("2").then((users) {
                      output = "";
                      for (int i = 0; i < users.length; i++)
                        output = output + "[ " + users[i].name + " ] ";
                      setState(() {});
                    });
                  },
                  // child: Text("POST"))
                  child: Text("GET")),
            ],
          ),
        ),
      ),
    );
  }
}
