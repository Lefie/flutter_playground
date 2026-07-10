import 'package:flutter/material.dart';
import './screens/book_intake_screen.dart';
import './screens/reading_list_screen.dart';



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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff083f68)),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff083f68),
          foregroundColor: Color(0xff84d0ff)
        ),
        scaffoldBackgroundColor: Color(0xff84d0ff),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff083f68),
              foregroundColor: Color(0xff84d0ff)
            ),
        ),
        useMaterial3: true,
      ),
      home: ReadingListScreen(),
    );
  }
}











