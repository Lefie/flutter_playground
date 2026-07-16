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
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(2),
              child: Column(
              children: [
                UserProfileForm(),
              ],
        ),
      ),
      ),
      ),
    );
  }
}

String movieName = "Spiderman: Brand New Day";

class Movie extends StatelessWidget {
  const Movie({super.key, required this.movieName});

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Text(movieName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),);
  }
}




class UserProfileForm extends StatefulWidget {
  const UserProfileForm({super.key});

  @override
  State<UserProfileForm> createState() => UserProfileFormState();
}

class UserProfileFormState extends State<UserProfileForm> {
  final _UserProfileFormKey = GlobalKey<FormState>();
  String username = "";
  String bio = "";
  bool isTomHollandFan = false;
  String spidermanActor = "";
  bool isMorningPerson = false;
  String anticipatedMovie = "Spiderman";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _UserProfileFormKey,
      child: Padding(
          padding: EdgeInsets.only(left:15, right:15),
          child:
            Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Please enter your username',
                  border: OutlineInputBorder(),
                ),
                onSaved: (String? value){
                  if (value != null) {
                    setState(() {
                      username = value;
                    });
                  }
                },
                validator: (String? value){
                  if (value == null || value.isEmpty) {
                    return "username is required";
                  }
                  return null;

                },
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Talk a little bit about yourself',
                  border: OutlineInputBorder(),
                ),
                onSaved: (String? value) {
                    if(value != null) {
                      setState(() {
                        bio = value;
                      });
                    }
                }
              ),
              SizedBox(height: 15,),
              CheckboxListTile(
                title: Text("Tom Holland Fan?"),
                value: isTomHollandFan,
                onChanged: (bool? value){
                  setState(() {
                    isTomHollandFan = value!;
                  });
                },
              ),
              SizedBox(height: 15,),
              Text("Favorite Spiderman Actor ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              RadioListTile(
                  title: Text("Tom Holland"),
                  value: "tom",
                  groupValue: spidermanActor,
                  onChanged: (String? value){
                    setState(() {
                      spidermanActor = value!;
                    });

                  }),

              RadioListTile(
                  title: Text("Andrew Garfield"),
                  value: "andrew",
                  groupValue: spidermanActor,
                  onChanged: (String? value){
                    setState(() {
                      spidermanActor = value!;
                    });
                  }),

              RadioListTile(
                  title: Text("Toby Maguire"),
                  value: "toby",
                  groupValue: spidermanActor,
                  onChanged: (String? value){
                    setState(() {
                      spidermanActor = value!;
                    });
                  }),

              SizedBox(height: 10,),

              SwitchListTile(
                  title: Text("Morning Person?"),
                  value: isMorningPerson,
                  onChanged: (bool value){
                    setState(() {
                      isMorningPerson = value;
                    });
                  }),

              Text("What is your most anticipated upcoming movie?", style: TextStyle(fontSize: 22),),
              DropdownButton<String>(
                  value: anticipatedMovie,
                  items: [
                    DropdownMenuItem(value:"Spiderman",child: Text("Spiderman: Brand New Day")),
                    DropdownMenuItem(value:"Odyssey",child: Text("The Odyssey")),
                    DropdownMenuItem(value:"Avengers",child: Text("Avengers: Doomsday")),
                  ],
                  onChanged: (String? value){
                    setState(() {
                      anticipatedMovie = value!;
                    });
                  }),

                Text("$username, $bio, $isTomHollandFan, ${spidermanActor}, ${isMorningPerson}, ${anticipatedMovie}"),
                ElevatedButton(onPressed: (){
                _UserProfileFormKey.currentState!.save();
                _UserProfileFormKey.currentState!.validate();

                }, child: Text("Submit")),

            ],
          ),)

    );
  }
}






/*
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

*/













