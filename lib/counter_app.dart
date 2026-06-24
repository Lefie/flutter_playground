import 'package:flutter/material.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();

}

class _CounterExampleState extends State<CounterExample> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter --;
    });

  }

  void _multiplyByTwo() {
    setState(() {
      _counter = _counter * 2;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: Colors.pink[100],
        ),
        width:450,
        height: 150,
        child: Column(
            children: [
              Text("$_counter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32
              )),
              SizedBox(height:15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    print("Elevated btn increase!");
                    _incrementCounter();
                  }, child: Text("+")),
                  FloatingActionButton(onPressed: (){
                    print("floating action button decrease");
                    _decrementCounter();
                  }, child: Text("-"),),
                  TextButton(onPressed: (){
                    print("text button reset");
                    _resetCounter();
                  }, child: Text("reset")),
                  FloatingActionButton(onPressed: (){
                    _multiplyByTwo();
                  }, child: Text("x2"),),
                ],
              )
            ]
        ),
      );
  }
}