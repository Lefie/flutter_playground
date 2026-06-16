import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget")
        ),
        body: ContainerExampleWidget(),)
    );
  }
}

class TextExampleWidget extends StatelessWidget {

  const TextExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
          textAlign: TextAlign.center,
          "I am text living inside a text widget",
          style: TextStyle(
            fontSize: 24,
            color:Colors.blue,
          )
      ),
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