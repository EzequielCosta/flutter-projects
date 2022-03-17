import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 202, 201, 201),
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
          ),
          body: IncrementNumber()),
    );
  }
}

class IncrementNumber extends StatefulWidget {
  const IncrementNumber({Key? key}) : super(key: key);

  @override
  _IncrementNumberState createState() => _IncrementNumberState();
}

class _IncrementNumberState extends State<IncrementNumber> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(_number.toString()),
          Container(
            width: 200,
            //color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIcon(_incrementNumber, Icons.arrow_upward, Colors.blue),
                ButtonSimple("ZERAR", const TextStyle(color: Colors.deepOrange),
                    _zerarNumber),
                _buildIcon(
                    _decrementNumber, Icons.arrow_downward, Colors.redAccent),
              ],
            ),
          )
        ]));
  }

  void _incrementNumber() {
    setState(() {
      _number++;
    });
  }

  void _decrementNumber() {
    setState(() {
      if (_number != 0) {
        _number--;
      }
    });
  }

  void _zerarNumber() {
    setState(() {
      _number = 0;
    });
  }

  Widget _buildIcon(Function function, IconData icon, Color color) {
    return IconButton(
        onPressed: () {
          function();
        },
        icon: Icon(
          icon,
          color: color,
        ));
  }

  Widget ButtonSimple(String text, TextStyle style, Function function) {
    return TextButton(
      child: Text(text, style: style),
      onPressed: () {
        function();
      },
    );
  }
}
