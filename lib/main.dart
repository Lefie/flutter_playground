import 'package:flutter/material.dart';
import 'navigation_between_screens.dart';
import "contact_list.dart";
import 'return_data_from_screen.dart';

void main() {
  runApp(const MyApp());
}



final List<Contact> contacts = [
  Contact('Alice', 'alice@email.com', '123-4567'),
  Contact('Bob', 'bob@email.com', '234-5678'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen() ,
        '/contacts': (context) => ContactsListScreen(contacts:contacts),
        '/advanced_example': (context) => ScreenOne(),
      },
    );
  }
}















