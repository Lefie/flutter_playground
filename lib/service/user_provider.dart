import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  User? _user;
  User? get user => _user;

  UserProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user){
      _user = user;
      notifyListeners();
    });
  }

}