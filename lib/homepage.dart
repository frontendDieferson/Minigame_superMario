import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supermariogame/button.dart';
import 'package:supermariogame/mario.dart';

import 'jumpingmario.dart';


class HomePage extends  StatefulWidget{
  const HomePage({super.key});


  @override
  _HomePageState createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {

  static double marioX = 0;
  static double marioY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = marioY;
  String direction = 'right';
  bool midrun = false;
  bool midjump = false;

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    midjump = true;
    preJump();
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;

      if(initialHeight - height > 1) {
        midjump = false;
        timer.cancel();
       setState(() {
         marioY = 1;
       });
      } else {
        setState(() {
          marioY = initialHeight - height;
        });
      }

    });
  }

  void movieRight() {
    direction = 'right';
    midrun = !midrun;
  setState(() {
    marioX += 0.02;

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if(const MyButton().userIsHoldingButton() == true){
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  });
  }

  void movieLeft() {
    direction = 'left';
    midrun = !midrun;
  setState(() {
    marioX -= 0.02;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Expanded(flex: 4, child: Container(
          color: Colors.blue,
          child: AnimatedContainer(
            alignment: Alignment(marioX, marioY),
            duration: const Duration(milliseconds: 0),
            child: midjump ? JumpingMario(
              direction: direction,
            ) : MyMario(
              direction: direction,
              midrun: midrun,
            )
          ),
        )),
        Expanded( flex: 1, child: Container(
          color: Colors.brown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
               function: movieLeft,
               child: const Icon(Icons.arrow_back, color: Colors.white,
               ),
             ),
              MyButton(
                function: jump,
                child: const Icon(Icons.arrow_upward, color: Colors.white,
                ),
              ),

               MyButton(
                function: movieRight,
                child: const Icon(Icons.arrow_forward, color: Colors.white,
                ),
              )
            ],
          ),
        ))
      ],
    )
    );
  }
}