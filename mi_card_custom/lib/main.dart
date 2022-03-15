import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 38, 138, 151),
        body: SafeArea(
            child: Container(
          color: Color.fromARGB(255, 94, 185, 178),
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/self.jpg"),
              ),
              Text(
                "Ezequiel Costa",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "Flutter Development",
                style: TextStyle(color: Colors.white70),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildIcon(Icons.whatsapp),
                    buildIcon(Icons.phone),
                    buildIcon(Icons.place),
                    buildIcon(Icons.email)
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Container buildIcon(IconData icon) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        width: 50,
        height: 50,
        child: Icon(
          icon,
          color: Colors.teal,
        ));
  }
}
