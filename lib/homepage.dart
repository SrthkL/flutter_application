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
    
    Timer.periodic(Duration(milliseconds: 50),(timer){
      time += 0.055;
      height = -2 * time * time + 2 * time;
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
            child: Stack(
          
              children:[
               GestureDetector(
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
              ),
            ),
            Container(
              alignment: Alignment(0,-0.3),


              child: gameHasStarted ? Text(" ") : Text("TAP  TO PLAY", style: TextStyle(fontSize: 20, color: Colors.white)
            )
             )
              ]
          ),
          ),
          Container(
            height: 20,
            color: Colors.green
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 82, 200, 86),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[Text("SCORE  ", style: TextStyle(color: Colors.white, fontSize: 35)),
                      SizedBox(
                        height: 20,
                      ),
                       Text("0", style: TextStyle(color: Colors.white, fontSize: 35))],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("BEST",style: TextStyle(color: Colors.white, fontSize: 35)), 
                      SizedBox(
                        height: 20,
                      ),
                      Text("10", style: TextStyle(color: Colors.white, fontSize: 35))],
                    )
                  ],
              ),
              
              )
          )
              
           ]   ,
          )

           
          )
          ;

        
    
  }
}