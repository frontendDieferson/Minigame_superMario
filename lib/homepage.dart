import 'package:flutter/material.dart';
import 'package:supermariogame/button.dart';


class HomePage extends  StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Expanded(flex: 4, child: Container(
          color: Colors.blue
        )),
        Expanded( flex: 1, child: Container(
          color: Colors.brown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             MyButton(
               child: const Icon(Icons.arrow_back),
             ),
              MyButton(
                child: const Icon(Icons.arrow_upward),
              ),
              MyButton(
                child: const Icon(Icons.arrow_forward),
              )
            ],
          ),
        ))
      ],
    )
    );
  }
}