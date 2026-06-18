import 'package:flutter/material.dart';
import 'text_example.dart';
import "column_example.dart";
import 'row_example.dart';
import "profile_card.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget"),
          backgroundColor: Colors.blue,
        ),
        body:SingleChildScrollViewHorizontalExample(),
      )
    );
  }

}




class ContainerExampleWidget extends StatelessWidget {
  const ContainerExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
      ),
      height: 100,
      width: 300,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text("I am text within a container")
    );
  }
}

class CenterExampleWidget extends StatelessWidget {

  const CenterExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      child: Center(child: Text("Hello Flutter") ,),
    );
  }

}

class PaddingExampleWidget extends StatelessWidget {

  const PaddingExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("Hello Flutter")
        ,),
    );
  }

}

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(color: Colors.purple),
        height: 100,
        width: 100,
        child: SingleChildScrollView(child:
          Column(
          children: [
            SizedBox(height: 10,),
            Text("1"),
            SizedBox(height: 10,),
            Text("1"),
            SizedBox(height: 10,),
            Text("1"),
            SizedBox(height: 10,),
            Text("1"),
          ],
        ),
      ),
      );
  }

}

class SingleChildScrollViewHorizontalExample extends StatelessWidget {
  const SingleChildScrollViewHorizontalExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width:300,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0xff0ea2ff),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x80113183), // Shadow color
              offset: const Offset(5.0, 7.0),             // X and Y displacement
              blurRadius: 5.0,                            // Softness of the shadow
            ),
          ],
        ),
        // padding: EdgeInsets.only(top:10, left:10),
        margin: EdgeInsets.only(left:10, top:10),
        // alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hello Flutter",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff113183),
                      shadows: [
                        Shadow(
                          color: Color(0x80113183), // Shadow color
                          offset: const Offset(3.0, 2.0),             // X and Y displacement
                          blurRadius: 5.0,                            // Softness of the shadow
                        ),
                      ],
                    )
                ),
                SizedBox(width:50),
                Text("Hello World",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff113183),
                      shadows: [
                        Shadow(
                          color: Color(0x80113183), // Shadow color
                          offset: const Offset(3.0, 2.0),             // X and Y displacement
                          blurRadius: 5.0,                            // Softness of the shadow
                        ),
                      ],
                    )
                ),
                SizedBox(width:50),
                Text("Hello Life",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff113183),
                      shadows: [
                        Shadow(
                          color: Color(0x80113183), // Shadow color
                          offset: const Offset(3.0, 2.0),             // X and Y displacement
                          blurRadius: 5.0,                            // Softness of the shadow
                        ),
                      ],
                    )
                )
              ],
            ),),
        )
    );
  }

}

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: ListTile(
        leading: Icon(Icons.album),
        title: Text("Album"),
        subtitle: Text("This is an album"),
        trailing: Icon(Icons.play_arrow),
        onTap: () {
          print("Check out this album");
        },
      ),
    );
  }
}