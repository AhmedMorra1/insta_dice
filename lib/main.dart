import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int nr = Random().nextInt(6) + 1;
  int nl = Random().nextInt(6) + 1;
  void nn() {
    nr = Random().nextInt(6) + 1;
    nl = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Center(child: Text('Insta Dice')),
          actions: <Widget>[],
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Image(
                    image: AssetImage('images/dice$nl.png'),
                  ),
                  onPressed: () {
                    setState(() {
                      nn();
                    });
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image(
                    image: AssetImage('images/dice$nr.png'),
                  ),
                  onPressed: () {
                    setState(() {
                      nn();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
