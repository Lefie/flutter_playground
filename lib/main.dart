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
      home: UserProfileScreen(),
    );
  }
}



class User {
  User({required this.username, required this.age, this.hobbies});

  final String username;
  final String age;
  List<String>? hobbies;
}

// Test Data
User u1 = User(username: "Winnie", age: "17", hobbies: ["Swimming", "Golfing", "Dancing"]);


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Username"),),
      body: UserProfileForm(),
    );
  }
}

class UserInformation extends StatelessWidget {
  UserInformation({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          // color: Colors.green,
          width: double.infinity,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle
              ),
              child: Padding(padding: EdgeInsets.all(10), child: Icon(Icons.person, size: 80),),
            ),
            SizedBox(height: 15,),
            Text(user.username),
            Text(user.age),
            SizedBox(height: 5,),
            Text("hobbies", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            SizedBox(height: 100,
              child: ListView.builder(
                itemCount: user.hobbies!.length,
                itemBuilder: (context,index){
                  if (user.hobbies == null || user.hobbies!.length == 0){
                    return Text("Add a hobby!");
                  }else {
                    return Text(user.hobbies![index],textAlign: TextAlign.center,);
                  }
                }),)
          ],
          ),),
      ) ,
    );
  }
}

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({super.key});

  @override
  State<UserProfileForm> createState() => UserProfileFormState();
}

class UserProfileFormState extends State<UserProfileForm> {
  final userProfileFormKey = GlobalKey<FormState>();

  String username = "";
  String age = "";
  bool isCatPerson = false;
  String? favoriteActivity = "";
  String upcomingMovie = "";


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
        key: userProfileFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your username",
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                if (value != null) {
                  setState(() {
                    username = value;
                  });
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty){
                  return "A username is required";
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "Enter your age",
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                if (value != null) {
                  setState(() {
                    age = value;
                  });
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty){
                  return "Am age is required";
                }
              },
            ),
            CheckboxListTile(
                title: Text("Is a Cat person ?"),
                value: isCatPerson,
                onChanged: (value){
                  if (value != null){
                    setState(() {
                      isCatPerson = value;
                    });
                  }

                },
            ),
            SizedBox(height: 10,),
            Text("Favorite Activity"),
            RadioListTile<String?>(
                title: Text("Spending time with friends") ,
                value: "quality_time",
                groupValue: favoriteActivity,
                toggleable: true,
                onChanged: (String? value){
                    setState(() {
                     favoriteActivity = value;
                    });
                }),
            RadioListTile(
                title: Text("reading a book") ,
                value: "reading",
                groupValue: favoriteActivity,
                toggleable: true,
                onChanged: (value){
                  setState(() {
                    favoriteActivity = value;
                  });
                }),

            SizedBox(height: 10,),
            Text("What upcoming movie are you most looking forward to?"),
            DropdownButton(
              value: upcomingMovie,
              items: [
                DropdownMenuItem(
                  value:"",
                  child: Text("Select your most anticipated upcoming movie"),
                ),
                DropdownMenuItem(
                    value:"Spiderman",
                    child: Text("Spiderman:Brand New Day"),
                ),
                DropdownMenuItem(value:"The Odyssey",child: Text("The Odyssey")),
                DropdownMenuItem(value:"Dune",child: Text("Dune")),
                ],
              onChanged: (String? value){
                setState(() {
                  upcomingMovie = value!;
                });
              },
              ),
            ElevatedButton(
                onPressed: (){
                  userProfileFormKey.currentState!.save();
                  userProfileFormKey.currentState!.validate();
                  print("user info: ${username}, ${age}, ${favoriteActivity}, ${upcomingMovie}");
                },
                child: Text("Submit")),
          ],
        ),
      ),),
    );
  }
}















