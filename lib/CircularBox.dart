
import 'package:flutter/material.dart';

class CircularBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.circle
      ),
    );
  }
}
