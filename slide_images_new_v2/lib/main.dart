import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Map<String, dynamic> images_liked = Map();
  Color colorIcon = Colors.white;

  @override
  Widget build(BuildContext context) {
    setImagesLiked();
    return Center(
      child: Column(children: <Widget>[_frameImage(), _footerButtons()]),
    );
  }

  void nextImg() {
    if (_imgCurrent < 5) {
      setState(() {
        _imgCurrent++;
      });

      getLike();
    }
  }

  void previousImg() {
    if (_imgCurrent != 1) {
      setState(() {
        _imgCurrent--;
      });

      getLike();
    }
  }

  void getLike() {
    if (images_liked.containsKey(_imgCurrent.toString())) {
      colorIcon =
          images_liked[_imgCurrent.toString()] == 1 ? Colors.red : Colors.white;
    } else {
      images_liked[_imgCurrent.toString()] = 0;
      colorIcon = Colors.white;
    }
  }

  void switchColorIconLike() {
    setState(() {
      colorIcon = (colorIcon == Colors.white) ? Colors.red : Colors.white;
    });
  }

  int switchValueIconLike() {
    int valueLike = 1;
    if (images_liked.containsKey(_imgCurrent.toString())) {
      valueLike = images_liked[_imgCurrent.toString()] == 0 ? 1 : 0;
    }

    return valueLike;
  }

  void saveLikeInImage() {
    // 0 - not like; 1 - like

    setState(() {
      images_liked[_imgCurrent.toString()] = switchValueIconLike();
    });
  }

  void saveInLocal() async {
    final disk = await SharedPreferences.getInstance();
    disk.setString('likes', json.encode(images_liked));
  }

  Future<Map<String, dynamic>> readInLocal() async {
    final disk = await SharedPreferences.getInstance();
    String json1 = disk.getString('likes')!;
    Map<String, dynamic> jsonData = json.decode(json1) as Map<String, dynamic>;
    return jsonData;
  }

  void setImagesLiked() async {
    Map<String, dynamic> mapp = await readInLocal();
    if (mapp.isNotEmpty) {
      setState(() {
        images_liked = mapp;
      });
      getLike();
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
        margin: const EdgeInsets.only(bottom: 40),
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
          saveInLocal();
        },
        icon: Icon(
          CupertinoIcons.heart_fill,
          color: colorIcon,
          size: 40,
        ));
  }
}
