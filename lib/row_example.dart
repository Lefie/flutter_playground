import 'package:flutter/material.dart';

class RowExampleWidget extends StatelessWidget{

  const RowExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:350,
      height: 150,
      decoration: BoxDecoration(
        color:Colors.yellow,
      ),
      child:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("1"),
          Text("2"),
          Text("3")
        ],),
    );
  }

}