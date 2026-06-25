import 'package:flutter/material.dart';

class SomeWidget extends StatelessWidget{
  const SomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Name: Olivia",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 167, 126, 238),
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: Offset(2.0,2.0),
                    blurRadius: 4.0,
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 237, 199),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2.0,1.0),
                    blurRadius: 3.0,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Padding(
                padding:EdgeInsets.only(left: 20),
                child: Text("Age: 16"),
              ),
            ),

            SizedBox(width: 20,),
            Text("Hobby: Video Games"),
            SizedBox(width: 100,),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
            Text("Hobby: Video Games"),
          ],
        ),
      ),
    );
  }
}