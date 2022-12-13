import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final child;
  final function;

  const MyButton( {super.key, this.child, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          color: Colors.brown[300],
          child: child,
        ),
      ),
    );
  }
}