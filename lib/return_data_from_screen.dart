import 'package:flutter/material.dart';


class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();

}

class _ScreenOneState extends State<ScreenOne> {


  String selected_result = "";


  @override
  Widget build(BuildContext context) {

    void _navigateAndGetResult() async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectionScreen()),
      );
      setState(() {
        selected_result = result;
      });

      print('Selected: $result');
    }

    return
    Scaffold(
      appBar: AppBar(title: Text("Example : Display returned data from a different screen "),),
      body:
      Center(child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF1C294A)
        ),
        height: 300,
        width: 300,
        child:
          Column(
            children: [
          SizedBox(height: 20,),
          SizedBox(
            width:100,
            height: 30,
            child: TextButton(
              onPressed: _navigateAndGetResult,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: Text("favorite pet!"),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            child: selected_result == "" ? null : Text("You selected $selected_result as your favortie pet!", style:TextStyle(color:Colors.white)),
          )
        ],)
      ),
      ),
    );
  }
}

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {



    @override
    Widget build(BuildContext context) {
      return
      Column(
        children: [
          SizedBox(height:10),
          SizedBox(
            width: 100,
            height: 30,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context, "Shiba Inu");
              },
              child: Text("Shiba Inu") ,
            ),
          ),
          SizedBox(height:10),
          SizedBox(
            width: 100,
            height: 30,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context, "Corgi");
              },
              child: Text("Corgi") ,
            ),
          ),

        ],
      );
    }
}

