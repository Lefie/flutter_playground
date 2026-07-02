import 'package:flutter/material.dart';
import 'counter_app.dart';
import 'text_field_example.dart';
import 'text_controller.dart';
import 'some_widget.dart';
import 'social_media_example.dart';
import 'in_class_example.dart';


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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF113183)),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Color(0xffa3a3a3),
        appBar: AppBar(
          title: Text("Stateful Widgets", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black38,
        ),
        body: CounterPage(),
      ),
    );
  }
}














