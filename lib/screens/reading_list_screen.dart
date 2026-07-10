import 'package:flutter/material.dart';

class ReadingListScreen extends StatefulWidget {
  const ReadingListScreen({super.key});

  State<ReadingListScreen> createState() => ReadingListScreenState();
}

class ReadingListScreenState extends State<ReadingListScreen> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Reading List"),
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Text("Reading List"),
         ],
       ),
     )
   );
  }
}