import 'package:flutter/material.dart';
import 'package:flutter_playground/service/auth_service.dart';
import 'package:flutter_playground/service/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final user = context.watch<UserProvider>().user;
    final _auth = AuthService();
    print("user object $user");


    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Welcome, ${user?.displayName ?? 'friend'}")),
            SizedBox(height: 100,),
            ElevatedButton(onPressed: () async{
               await _auth.signOut();
            }, child: Text("Log out"))
          ],
        ),
      ),
    );
  }

}