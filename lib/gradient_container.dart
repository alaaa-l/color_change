import 'package:color_changer/color_button.dart';
import 'package:color_changer/direction_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  int red = 255;
  int green = 33;
  int blue = 150;
  Color currentColor = Colors.blue;
  List<List<Alignment>> al = [
    [Alignment.centerLeft, Alignment.centerRight], // 1. Horizontal
    [Alignment.topCenter, Alignment.bottomCenter], // 2. Vertical
    [Alignment.topLeft, Alignment.bottomRight], // 3. Diagonal ↘
    [Alignment.bottomLeft, Alignment.topRight], // 4. Diagonal ↗
  ];
  List<String> dir = ["Vertical", "Horizontal", "Left-Right", "Right-Left"];

  var start = Alignment.centerLeft;
  var finish = Alignment.centerRight;
  var directionIndex = 0;
  void changeColor() {
    setState(() {
      var random = Random();
      red = random.nextInt(256);
      green = random.nextInt(256);
      blue = random.nextInt(256);
      currentColor = Color.fromRGBO(red, green, blue, 1);
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % al.length;
      start = al[directionIndex][0];
      finish = al[directionIndex][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [currentColor, Colors.white, currentColor],
          begin: start,
          end: finish,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            ColorButton(changeColor),
            Text('Red: $red Green: $green Blue: $blue'),
            DirectionButton(changeDirection),
            Text('Direction: ${dir[directionIndex]}'),
          ],
        ),
      ),
    );
  }
}
