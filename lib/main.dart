import 'package:flutter/material.dart';
import 'volunteer_form.dart';
import 'outreach_intake_form.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF045EAD)),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF252525),
        appBar: AppBar(
          title: Text("Forms in Flutter", style:TextStyle(color:Colors.white70) ),
          backgroundColor: Color(0xFF1C1C1C),
        ),
         body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
               children: [
              SizedBox(height:30),
              Expanded(child: IntakeForm()),
            ],
          ),
          ),
        ),
      )
    );
  }
}


