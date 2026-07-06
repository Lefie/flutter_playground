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
              Expanded(child: MyForm()),
              //Expanded(child: IntakeForm()),
            ],
          ),
          ),
        ),
      )
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CheckboxListTile(
             title: Text("Agree to terms and condition", style: TextStyle(color: Colors.white54)),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = !isChecked;
                });
            })
      ],)
    );
  }
}


