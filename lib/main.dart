import 'package:flutter/material.dart';
import 'counter_app.dart';
import 'text_field_example.dart';
import 'text_controller.dart';
import 'some_widget.dart';
import 'social_media_example.dart';


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
        backgroundColor: Color(0xff191919),
        appBar: AppBar(
          title: Text("Stateful Widgets", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black38,
        ),
        body: SocialMediaPost(),
      ),
    );
  }
}


// class content
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // State variables go here
  int _counter = 0;

  void increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text('$_counter', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32
            )),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: (){
                print("+ button pressed!!!");
                increment();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[700],
              ),
              child: Text("+")
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              print("number should decrease");
              setState(() {
                _counter -= 1;
              });
            }, child: Text("-"))
          ],
        )
      );
  }
}












