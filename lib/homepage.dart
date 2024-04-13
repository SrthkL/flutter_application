import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/barriers.dart';

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
  double barrierXtwo= barrierXone + 1.5;
  static double barrierXone= 0;


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
        barrierXone -= 0.03;
        barrierXtwo -= 0.03;

        birdYaxis = initialHeight - height;

      });
      setState(() {
        if(barrierXone < -1.1){
        barrierXone +=2.2;
      }else{
        barrierXone -=0.05;
      }

        
      });
      setState(() {
        if(barrierXtwo < -1.1){
        barrierXtwo +=2.2;
      }else{
        barrierXtwo-=0.05;
      }

        
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
    return GestureDetector(
       onTap:(){
                if(gameHasStarted){
                  jump();
                }
                else {
                  startGame();
                }
              },
      child: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
          
              children:[
               
             
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
             ),
            AnimatedContainer(
              alignment: Alignment(barrierXone,1.1),
              duration: Duration(milliseconds: 0),
              child: MyBarrier(
                size: 200.0,)
            ),
            AnimatedContainer(
              alignment: Alignment(barrierXone,-1.1),
              duration: Duration(milliseconds: 0),
              child: MyBarrier(
                size: 200.0,)
            ),
            AnimatedContainer(
              alignment: Alignment(barrierXtwo,1.1),
              duration: Duration(milliseconds: 0),
              child: MyBarrier(
                size: 150.0,)
            ),
            AnimatedContainer(
              alignment: Alignment(barrierXtwo,-1.1),
              duration: Duration(milliseconds: 0),
              child: MyBarrier(
                size: 250.0,)
            ),


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