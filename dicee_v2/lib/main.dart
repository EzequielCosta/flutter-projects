import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.red,
    appBar: AppBar(
      title: const Text('Dicee'),
      backgroundColor: Colors.red,
    ),
    body: DicePage(),
  )));
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int? leftDiceNumber;
  int? rightDiceNumber;

  void changeDiceFace() {
    int lNumber = Random().nextInt(8) + 1;
    int rNumber = Random().nextInt(8) + 1;

    while (lNumber == rNumber) {
      rNumber = Random().nextInt(8) + 1;
    }

    setState(() {
      leftDiceNumber = lNumber;
      rightDiceNumber = rNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeDiceFace();

    return Center(
        child: Row(
      children: <Widget>[
        Expanded(
            child: TextButton(
          child: Image.asset('images/octaedro$leftDiceNumber.png'),
          onPressed: () {
            changeDiceFace();
          },
        )),
        Expanded(
          child: TextButton(
            child: Image.asset('images/octaedro$rightDiceNumber.png'),
            onPressed: () {
              changeDiceFace();
            },
          ),
        )
      ],
    ));
  }
}
