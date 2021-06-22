import 'package:flutter/material.dart';
import 'package:weather_app/views/Forground.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        new Positioned(
            bottom: height / 2.4,
            child: Image.network(
              "https://i.ibb.co/Y2CNM8V/new-york.jpg",
              height: height,
            )),
        new Positioned(
            bottom: 0,
            child: Container(
              height: height / 2.4,
              width: width,
              color: Color(0xFF2D2C35),
            )),
        Forground()
      ],
    );
  }
}
