import 'package:flutter/material.dart';

import 'practice_screen.dart';

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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF125096)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF125096),
          foregroundColor: Color(0xFF63AFFF),
        ),
      ),
      home: const PracticeScreen(),
    );
  }
}
