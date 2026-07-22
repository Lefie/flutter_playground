import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_playground/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/login_screen.dart';
import './screens/sign_up_screen.dart';
import './service/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: const MyApp(),
    ),
  );
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
        useMaterial3: true,
      ),
      home: Consumer<UserProvider>(
        builder: (context, userPro, _ ){
          return userPro.user == null ? LoginScreen() : HomeScreen();
        },
      ),
    );
  }
}









