import 'package:flutter/material.dart';

class ColumnExampleWidget extends StatelessWidget{

  const ColumnExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:200,
      height: 350,
      decoration: BoxDecoration(
        color:Colors.lightBlue,

      ),
      child:  Column(
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