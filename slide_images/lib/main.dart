import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Super Mario Images"),
          backgroundColor: Colors.deepOrange,
        ),
        body: const SuperMario(),
      ),
    );
  }
}

class SuperMario extends StatefulWidget {
  @override
  const SuperMario({Key? key}) : super(key: key);

  @override
  _SuperMarioState createState() => _SuperMarioState();
}

class _SuperMarioState extends State<SuperMario> {
  int _imgCurrent = 1;
  //Map<int, int> images_liked = new Map();
  var images_liked = {};
  Color colorIcon = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[_frameImage(), _footerButtons()]),
    );
  }

  void nextImg() {
    if (_imgCurrent < 5) {
      setState(() {
        _imgCurrent++;
      });

      if (images_liked.containsKey(_imgCurrent)) {
        colorIcon = images_liked[_imgCurrent] == 1 ? Colors.red : Colors.white;
      } else {
        images_liked[_imgCurrent] = 0;
        colorIcon = Colors.white;
      }
    }
  }

  void previousImg() {
    if (_imgCurrent != 1) {
      setState(() {
        _imgCurrent--;
      });

      if (images_liked.containsKey(_imgCurrent)) {
        colorIcon = images_liked[_imgCurrent] == 1 ? Colors.red : Colors.white;
      } else {
        images_liked[_imgCurrent] = 0;
        colorIcon = Colors.white;
      }
    }
  }

  Widget buildIconButton(Function function, IconData icon,
      [Color colorIcon = Colors.teal]) {
    return IconButton(
        iconSize: 50,
        onPressed: () {
          function();
        },
        icon: Icon(
          icon,
          color: colorIcon,
          size: 50,
        ));
  }

  Widget _footerButtons() {
    return Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildIconButton(previousImg, Icons.arrow_circle_left_sharp),
            buildIconLike(),
            buildIconButton(nextImg, Icons.arrow_circle_right_sharp),
          ],
        ));
  }

  Widget _frameImage() {
    return Expanded(
      child: Image.asset(
        'images/img$_imgCurrent.png',
        width: 200,
        height: 400,
      ),
    );
  }

  Widget buildIconLike() {
    return IconButton(
        iconSize: 40,
        onPressed: () {
          switchColorIconLike();
          saveLikeInImage();
        },
        icon: Icon(
          CupertinoIcons.heart_fill,
          color: colorIcon,
          size: 40,
        ));
  }

  void switchColorIconLike() {
    setState(() {
      colorIcon = colorIcon == Colors.white ? Colors.red : Colors.white;
    });
  }

  int switchValueIconLike() {
    int valueLike = 1;
    if (images_liked.containsKey(_imgCurrent)) {
      valueLike = images_liked[_imgCurrent] == 0 ? 1 : 0;
    }

    return valueLike;
  }

  void saveLikeInImage() {
    // 0 - not like; 1 - like

    setState(() {
      images_liked[_imgCurrent] = switchValueIconLike();
    });
  }
}
