import 'package:flutter/material.dart';
import 'package:weather_app/views/Home.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return new MaterialApp(
      title: "WallpaperHub",
      theme: new ThemeData(
        primaryColor: Color(0xFF212121),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
