import 'package:flutter/material.dart';
import 'list_view_example.dart';
import 'list_view_builder_example.dart';
import 'list_view_separated.dart';

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
        useMaterial3: true,
      ),
      home: Scaffold(
      appBar: AppBar(title: Center(child: Text("Lists",),),) ,
      body: Center(
            child: Example2()
          ),
      ),
    );
  }
}

class People {
  final String name;
  final String email;

  People(this.name, this.email);
}

class Example1 extends StatelessWidget {
  Example1({super.key});

  List<Map<String, dynamic>> mallNavigations = [
    {
    "icon": Icon(Icons.fastfood),
    "name": "Dining",
    "description":"One and only dining experience"
    },
    {
      "icon": Icon(Icons.attractions),
      "name": "Attractions",
      "description":"Discover and explore"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          tileColor: Color(0xffadc5d1) ,
          leading: mallNavigations[0]["icon"],
          title: Text(mallNavigations[0]["name"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          subtitle: Text(mallNavigations[0]["description"]),
          trailing: Icon(Icons.arrow_right),
        ),
        SizedBox(height: 2,),
        ListTile(
          tileColor: Color(0xffadc5d1) ,
          leading: mallNavigations[1]["icon"],
          title: Text(mallNavigations[1]["name"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          subtitle: Text(mallNavigations[1]["description"]),
          trailing: Icon(Icons.arrow_right),
        ),
      ],
    );

  }
}

class Example2 extends StatelessWidget {
  Example2({super.key});

  List<People> people = [
    People("Winnie","winnie@gmail.com"),
    People("Jack","jack@gmail.com"),
    People("Lily","lily@gmail.com"),
  ];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
            return ListTile(
              tileColor: Color(0x803a3a40) ,
              title: Text(people[index].name),
              subtitle: Text(people[index].email),
            );
        },
    );
  }
}

class Example3 extends StatelessWidget {
  Example3({super.key});

  List<Map<String, dynamic>> people = [
    {
      "name": "Winnie",
      "email": "winnie@gmail.com",
    },
    {
      "name": "Jack",
      "email": "jack@gmail.com",

    },
    {
      "name": "Lily",
      "email": "lily@gmail.com",
      "age": 24,
      "favorite_color": "coral",
    },
  ];



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: Color(0x803a3a40) ,
          title: Text(people[index]["name"]),
          subtitle: Text(people[index]["email"]),
        );
      },
      separatorBuilder: (context, index){
        return SizedBox(height: 2,);
      },
    );
  }
}

class Example4 extends StatelessWidget {
  Example4({super.key});

  List<Map<String, dynamic>> people = [
    {
      "name": "Winnie",
      "email": "winnie@gmail.com",
    },
    {
      "name": "Jack",
      "email": "jack@gmail.com",

    },
    {
      "name": "Lily",
      "email": "lily@gmail.com",
      "age": 24,
      "favorite_color": "coral",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Fetch new data
        await Future.delayed(Duration(seconds: 3));
      },
      child: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) => ListTile(title: Text(people[index]["name"])),
      ),
    );
  }
}






