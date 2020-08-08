import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Center(
            child: Text(
              "ESP Http",
              style: TextStyle(
                color: Colors.cyan[800],
                fontSize: 27.5,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ButtonPage(),
      ),
    ),
  );
}

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  Future<void> ledOn() async {
    var url = 'http://192.168.1.1/ledOn';
    var req = await http.get(url);
  }

  Future<void> ledOff() async {
    var url = 'http://192.168.1.1/ledOff';
    var req = await http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: FlatButton(
            onPressed: () {
              setState(() {
                ledOn();
              });
            },
            child: Text(
              "ON",
              style: TextStyle(color: Colors.teal),
            ),
            color: Colors.amberAccent,
          ),
        ),
        Center(
          child: FlatButton(
            onPressed: () {
              setState(() {
                ledOff();
              });
            },
            child: Text(
              "OFF",
              style: TextStyle(color: Colors.teal),
            ),
            color: Colors.amberAccent,
          ),
        ),
      ],
    );
  }
}
