import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'user_profile.dart';

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
      home: const UserProfile(username: "Winnie",email: "winnie@gmail.com",bio:"I love reading books", hobbies: ["quality time","books","church"],),
    );
  }
}
