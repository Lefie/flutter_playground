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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("About Me"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: SizedBox(
            width:300.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name: Lemon"),
                  Text("Age: 25"),
                  Text("Hobby: Cooking"),
                  Text("Welcome to Flutter! This is a long sentence that will demonstrate how text trimming and custom styling work in a practical layout.",textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,)
                ],
              ),
          )
        )
      ),
    );
  }
}




