import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static List<Widget> ch = [];
  static List<int> reads = [];
  //int sum = 0;

  void add() {
    if (ch.length < 10) {
      //sum = 0;
      int randomNumber = Random().nextInt(6) + 1;
      ch.add(Dice(
        n: randomNumber,
      ));
      reads.add(randomNumber);
    } else {
      print('Max is 10');
    }
  }

  void remove() {
    if (ch.length > 0) {
      //sum = 0;
      ch.removeLast();
      reads.removeLast();
    } else {
      print('nothing to remove');
    }
  }

  int sumReads() {
    int sum = 0;
    for (int i = 0; i < reads.length; i++) {
      sum = sum + reads[i];
    }
    return sum;
  }

  void refresh() {
    for (int i = 0; i < ch.length; i++) {
      int randomNumber = Random().nextInt(6) + 1;
      ch[i] = Dice(
        n: randomNumber,
      );
      reads[i] = randomNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    remove();
                    sumReads();
                  });
                },
              ),
              Text(
                ' ${ch.length.toString()}/10 ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              FlatButton(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    add();
                    sumReads();
                  });
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black12,
          centerTitle: true,
          title: Text('Insta Dice'),
          actions: <Widget>[
            Center(
              child: Text(
                '${sumReads().toString()}',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            FlatButton(
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  refresh();
                });
                setState(() {
                  sumReads();
                });
              },
            )
          ],
        ),
        backgroundColor: Colors.black45,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: ch),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final int n;
  Dice({this.n});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Image(
            image: AssetImage('images/dice$n.png'),
          ),
        ),
      ),
    );
  }
}
