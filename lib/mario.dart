import 'dart:math';

import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {

  final direction;
  final midrun;

  const MyMario({super.key, this.direction, this.midrun});

  @override
  Widget build(BuildContext context) {
   if(direction == 'right') {
     return SizedBox(
       width: 50,
       height: 50,
       child: midrun
           ? Image.asset('lib/assets/standingMario.png')
           : Image.asset('lib/assets/runningMario.png'),
     );
   } else {
     return Transform(
      alignment: Alignment.center,
       transform: Matrix4.rotationY(pi),
       child: SizedBox(
         width: 50,
         height: 50,
         child: midrun
             ? Image.asset('lib/assets/standingMario.png')
             : Image.asset('lib/assets/runningMario.png'),
       ),
     );
   }
  }
}
