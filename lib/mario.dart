import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  const MyMario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Image.asset('lib/assets/standingMario.png'),
    );
  }
}
