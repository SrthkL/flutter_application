import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application/bird.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis =0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;


    void jump(){
    setState(() {
      time =0;
      initialHeight = birdYaxis;
    });
  }


    void startGame(){
      gameHasStarted = true;
    
    Timer.periodic(Duration(milliseconds: 60),(timer){
      time += 0.055;
      height = -4.9 * time * time + 2.7 * time;
      setState((){

        birdYaxis = initialHeight - height;

      });
      if(birdYaxis > 1){
        birdYaxis =1;
        timer.cancel();
        gameHasStarted = false ;
      }
    
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap:(){
                if(gameHasStarted){
                  jump();
                }
                else {
                  startGame();
                }
              },
            child: AnimatedContainer(
              alignment: Alignment(0,birdYaxis),
              duration: Duration(milliseconds:0),
              color: const Color.fromARGB(255, 66, 156, 230),
              child: MyBird(),
              )
            )
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 82, 200, 86),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[Text("SCORE"), Text("0")],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("BEST"), Text("10")],
                    )





                  ]





              ),)
              
              
              ),


           ] ),
        )
    ;
  }
}