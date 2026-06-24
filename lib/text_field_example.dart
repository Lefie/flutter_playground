import 'package:flutter/material.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {

  String _inputText = "";
  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
   return  Center(
     child:
     Container(
       width: 800,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text("Who is your favorite author?", style: TextStyle(fontSize: 25)),
           SizedBox(
             width: 250,
             child: TextField(
               decoration: InputDecoration(
                 labelText: "Enter the name of an author",
               ),
               onChanged: (value){
                 print(value);
                 setState(() {
                   _inputText = value;
                 });
               },
             ),
           ),
           TextButton(onPressed: (){
             print("input text is $_inputText");
             todos.add(_inputText);
           }, child: Text("submit")),
           SizedBox(height: 20,),
           Text("$_inputText"),
           Row(children: todos.map((String todo) {
                 return SizedBox(child: Text("$todo"));
               }).toList(),
           )
         ],
       ),
     )
   );
  }
}