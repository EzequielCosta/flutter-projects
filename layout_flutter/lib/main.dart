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
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 100,
              height: 500,
              color: Colors.white,
              child: Text(""),
            ),
            Container(
                child: (Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.greenAccent,
                    child: Text(""),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellowAccent,
                    child: Text(""),
                  )
                ]))),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 100,
              height: 500,
              color: Colors.redAccent,
              child: Text(""),
            )
          ],
        )),
      ),
    );
  }
}
