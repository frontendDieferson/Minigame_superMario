import 'dart:math';

import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {

  final direction;

  const JumpingMario({super.key, this.direction});


  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(('lib/assets/jumpingMario.png')),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(('lib/assets/jumpingMario.png')),
        ),
      );
    }
  }
}