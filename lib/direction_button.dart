import 'package:flutter/material.dart';

class DirectionButton extends StatelessWidget {
  DirectionButton(this.onPress, {super.key});
  void Function() onPress;

  @override
  Widget build(context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white)),
      child: Text(
        'Change Direction',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
