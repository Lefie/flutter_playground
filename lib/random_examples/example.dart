
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Jesus I trust in You");
      },
      child: Container(
        width:100,
        height:100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Colors.green,Colors.blue]) ,
            border: Border.all(
                color: Color(0xff083f68)
            )
        ),
        child: Center(child: Text("Trust"),),


      ),
    );
  }
}