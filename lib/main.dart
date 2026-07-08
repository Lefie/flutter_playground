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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF083F68)),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF083F68),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Color(0xFF61B7E8),
          )
        ),
        scaffoldBackgroundColor: Color(0xFF61B7E8),
        useMaterial3: true,
      ),
      home: AccountCreationScreen(),

    );
  }
}

class Account {
  String? username;
  String? email;
  String? password;

  Account({this.username, this.email, this.password});
}


class AccountCreationScreen extends StatefulWidget {
  @override
  _AccountCreationScreenState createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  Account acc = Account();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 130,),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username"
                  ),
                  onSaved: (String? value){
                          setState(() {
                            acc.username = value;
                          });
                  },
                ) ,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                  onSaved: (String? value){
                    setState(() {
                      acc.email = value;
                    });

                  },
                ) ,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                  ),
                  onSaved: (String? value){
                    setState(() {
                      acc.password = value;
                    });
                  },
                ) ,
              ),
              SizedBox(height: 20,),
              Align(alignment: Alignment.center,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF083F68),
                      foregroundColor: Color(0xFF61B7E8)
                  ),
                  onPressed: (){
                    _formKey.currentState!.save();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(acc: acc)));
                  },
                  child: Text("Register"), ),)

              // Form fields go here
            ],
          ),
        ),
      ),
    );

  }
}


class HomeScreen extends StatelessWidget{
  HomeScreen({super.key, this.acc});

  Account? acc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Column(
        children: [
          Text("Welcome, ${acc?.username ??  "Winnie"}"),
          SizedBox(height:30),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Return"))

        ],
      ),),
    );
  }
}

/*
// advanced example
initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen() ,
        '/contacts': (context) => ContactsListScreen(contacts:contacts),
        '/advanced_example': (context) => ScreenOne(),
},
 */















