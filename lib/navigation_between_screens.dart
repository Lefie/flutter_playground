import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Container(
            width: 300,
            height: 300,
            color: Color(0xFF82A1F3),
            child: Column(
              children: [
                Text("Home Screen"),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }, child: Text("Second Screen")),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()));
                }, child: Text("Third Screen")),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/contacts');
                }, child: Text("Contacts"))
              ],
            )
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Container(
            width:300,
            height: 300,
            color: Color(0xFF82A1F3),
            child: Column(
              children: [
                Text("Second Screen"),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Go Back")),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                }, child: Text("Second Screen")),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdScreen()));
                }, child: Text("Third Screen"))
              ],
            )
        ),
      ),
    );
  }

}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Screen")),
      body: Center(
        child: Container(
            width:300,
            height: 300,
            color: Color(0xFF82A1F3),
            child: Column(
              children: [
                Text("Third Screen"),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Go Back"))
              ],
            )
        ),
      ),
    );
  }

}