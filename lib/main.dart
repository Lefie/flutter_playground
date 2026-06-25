import 'package:flutter/material.dart';
import 'list_view_example.dart';
import 'list_view_builder_example.dart';
import 'list_view_separated.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
      body: Center(
            child:
            Container(
            width: 300,
            height: 300,
            color: Color(0xFF82A1F3),
            child: ListViewSeparated(profiles: people),
            ),
          ),
      ),
    );
  }
}


List<Map<String, dynamic>> people = [
  {"name": "Winnie",
    "email": "winnie@gmail.com",
    "dog_person": false
  },
  {"name": "Jack",
    "email": "jack@gmail.com",
    "dog_person": true
  },
  {"name": "Lily",
    "email": "lily@gmail.com",
    "dog_person": true
  },
];





