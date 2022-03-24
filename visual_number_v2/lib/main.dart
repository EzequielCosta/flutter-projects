import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text('Visual Number'),
      backgroundColor: Colors.blueGrey,
    ),
    body: VisualNumberPage(),
  )));
}

class VisualNumberPage extends StatefulWidget {
  @override
  State<VisualNumberPage> createState() => _VisualNumberPageState();
}

class _VisualNumberPageState extends State<VisualNumberPage> {
  int number = Random().nextInt(99) + 1;

  void addOne() {
    setState(() {
      number += 1;
    });
  }

  void subtractOne() {
    setState(() {
      if (number > 0) number -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
          child: Text(
            "$number",
            style: const TextStyle(
              fontSize: 80,
            ),
          ),
        )),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  child: buildContainer('-', Colors.redAccent,
                      const TextStyle(fontSize: 60, color: Colors.white)),
                  onPressed: () {
                    subtractOne();
                  },
                ),
              ),
              Expanded(
                  child: TextButton(
                child: buildContainer('Zerar', Colors.redAccent,
                    const TextStyle(fontSize: 15, color: Colors.white)),
                onPressed: () {
                  setState(() {
                    number = 0;
                  });
                },
              )),
              Expanded(
                  child: TextButton(
                child: buildContainer('Refresh', Colors.blueAccent,
                    const TextStyle(fontSize: 15, color: Colors.white)),
                onPressed: () {
                  setState(() {
                    number = Random().nextInt(99) + 1;
                  });
                },
              )),
              Expanded(
                  child: TextButton(
                child: buildContainer('+', Colors.greenAccent,
                    const TextStyle(fontSize: 60, color: Colors.white)),
                onPressed: () {
                  addOne();
                },
              ))
            ],
          ),
        )
      ],
    );
  }
}

Container buildContainer(String text, Color color, [TextStyle? style]) {
  return Container(
      width: 100,
      height: 100,
      color: color,
      child: Center(
        child: Text(text, style: style),
      ));
}
