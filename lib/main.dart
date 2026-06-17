import 'package:flutter/material.dart';
import 'text_example.dart';
import "column_example.dart";
import 'row_example.dart';

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
        body: PaddingExampleWidget(),
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

