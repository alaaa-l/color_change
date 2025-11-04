import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  ColorButton(this.onTap, {super.key});

  void Function() onTap;

  @override
  Widget build(context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white)),
      child: Text(
        'Change Color',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
