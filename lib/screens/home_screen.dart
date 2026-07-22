import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/dataModel/user_profile.dart';
import 'package:flutter_playground/service/auth_service.dart';
import 'package:flutter_playground/service/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_playground/service/firestore_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  final _authService = AuthService();
  final _dbService = FirestoreService();
  String? userAge;
  String? petName;


  int index = 0;

  void getInfo(String type,String info){
    print("$info");
    setState(() {
      if (type == "age") {
        userAge = info;
      }
      if(type == "pet_name") {
        petName = info;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Center(child: Text("Welcome, ${user?.displayName ?? 'friend'}")),
              SizedBox(height: 100,),
              UserProfileQuestion(type: "age", getValues: getInfo),
              SizedBox(height: 20,),
              UserProfileQuestion(type: "name_of_the_pet", getValues: getInfo,),
              SizedBox(height: 20,),
              TextButton(onPressed: () async{
                 print("age: $userAge, pet: $petName");

                 if (userAge != null && petName!= null) {
                   UserProfile user = UserProfile(age: userAge!, petName: petName!);
                   await _dbService.addOneUserProfile(user);
                 }

              }, child: Text("next")),
              ElevatedButton(onPressed: () async{
                await _authService.signOut();
              }, child: Text("Log out"))
            ],
          ),
        )
      ),
    );
  }
}

class UserProfileQuestion extends StatefulWidget {

  const UserProfileQuestion({super.key, required this.type, required this.getValues});

  final String type;
  final void Function(String a, String b) getValues;

  State<UserProfileQuestion> createState() => UserProfileQuestionState();
}

class UserProfileQuestionState extends State<UserProfileQuestion> {

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _petNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'age':
        return  TextField(
          controller: _ageController,
          decoration: InputDecoration(
            labelText: "age",
          ),
          onChanged:  (value)=>widget.getValues("age",value),
        );
      case 'name_of_the_pet':
        return TextField(
          controller: _petNameController,
          decoration: InputDecoration(
            labelText: "pet name",
            hintText: "Judy",
            helperText: "name your learning pet companion"
          ),
          onChanged: (value)=>widget.getValues("pet_name",value) ,

        );
      default:
        return Text("something is wrong");
    }
  }
}