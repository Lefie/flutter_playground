import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',


      home: Scaffold(
        appBar: AppBar(title: Text('About Me'), backgroundColor: Colors.blue),
        body: CounterPage(),
      ),
    );
  }
}


class SomeWidget extends StatelessWidget {
  const SomeWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  ),
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
                    offset: Offset(2.0, 1.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Age: 16"),
              ),
            ),
            SizedBox(width: 20),
            Text("Hobby: Video Games"),
            SizedBox(width: 100),
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


            SizedBox(
              width: 500,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Some Person"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}


class _CounterPageState extends State<CounterPage> {
  // State variables go here
  int _counter = 0;
  String username = "";


  final TextEditingController _username = TextEditingController();


  void increment() {
    setState(() {
      _counter += 1;
    });
  }


  void decrement() {
    setState(() {
      _counter -= 1;
    });
  }


  void displayUsername() {
    setState(() {
      username = _username.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Count: $_counter'),
          SizedBox(height: 10,),
          TextButton(
            onPressed: (){
              increment();
            },
            child: Text("+"),
          ),
          TextButton(
              onPressed: (){
                decrement();
              }
              , child: Text("-")
          ),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 245, 245, 245),
                filled: true,
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
              controller: _username,
            ),
          ),

          TextButton(
            onPressed: (){
              print(_username.text);
            },
            child: Text("some btn"),
          ),
        ],
      ),
    );
  }
}



class TextFieldAlignExample extends StatelessWidget {
  const TextFieldAlignExample({ super.key });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: SizedBox(
        width:300,
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter your name"
          ),
        ),
      ),
    );
  }

}