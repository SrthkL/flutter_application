import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget{
final size;
    MyBarrier({this.size});


  @override 
  Widget build(BuildContext context){
    return Container(
      width : 80,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Color.fromARGB(255, 39, 125, 42)),
        color: Color.fromARGB(255, 21, 169, 26)




      )
      
      );

    
  }
}