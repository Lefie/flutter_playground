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
      body: ListViewSeparatedExample(),
      ),
    );
  }
}

class People {
  String? name;
  String? email;
  String? gender;

  People({this.name, this.email, this.gender});
}



class WorldCupLikes {
  String countryName;
  int likeCount;

  WorldCupLikes({ this.countryName = "Argentina", this.likeCount = 0});
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

/*
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
*/


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

class ExampleWorldCup extends StatefulWidget {
  const ExampleWorldCup({super.key});

  @override
  State<ExampleWorldCup> createState() => ExampleWorldCupState();

}

class ExampleWorldCupState extends State<ExampleWorldCup> {

  List<WorldCupLikes> teams = [
    WorldCupLikes(countryName: "Argentina", likeCount: 0),
    WorldCupLikes(countryName: "France", likeCount: 0),
    WorldCupLikes(countryName: "Switzerland", likeCount: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return ListTile(
            title: Text(teams[index].countryName),
            subtitle: Text(teams[index].likeCount.toString()),
            trailing: IconButton(onPressed: (){
              print(teams[index].countryName);
              setState(() {
                teams[index].likeCount ++;
              });
            }, icon: Icon(Icons.favorite_border)),
          );
        },
        separatorBuilder: (context, index){
          return SizedBox(height:2);
        },
        itemCount: teams.length);
  }

}

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 2,),
        ListTile(
          tileColor: Color(0xff52c5f3),
          leading: Icon(Icons.person),
          title: Text("Winnie"),
          subtitle: Text("winnie@gmail.com"),
          trailing: Icon(Icons.arrow_right),
          onTap: (){
            print("Winnie");
          },
        ),
        SizedBox(height: 2,),
        ListTile(
          tileColor: Color(0xff52c5f3),
          leading: Icon(Icons.person),
          title: Text("Jack"),
          subtitle: Text("jack@gmail.com"),
          trailing: Icon(Icons.arrow_right),
          onTap: (){
            print("Jack");
          },
        ),
        SizedBox(height: 2,),
        ListTile(
          tileColor: Color(0xff52c5f3),
          leading: Icon(Icons.person),
          title: Text("Lily"),
          subtitle: Text("lily@gmail.com"),
          trailing: Icon(Icons.arrow_right),
          onTap: (){
            print("Lily");
          },
        ),
      ],
    );
  }
}

class ListViewBuilderExample extends StatelessWidget {
   ListViewBuilderExample({super.key});

  final List<Map<String, dynamic>> contacts = [
    {
      "name": "Winnie",
      "email": "winnie@gmail.com",
      "gender": "female"
    }, {
      "name": "Jack",
      "email": "jack@gmail.com",
      "gender": "male"
    },
    {
    "name": "Patrick",
    "email": "patrick@gmail.com",
    "gender": "male"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contacts.length ,
        itemBuilder: (context, index){
          return ListTile(
            tileColor: Color(0xff52c5f3),
            leading: contacts[index]["gender"] == "female" ? Icon(Icons.female) : Icon(Icons.male),
            title: Text(contacts[index]["name"]),
            subtitle: Text(contacts[index]["email"]),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print(contacts[index]["name"]);
            },
          );
        }
    );
  }
}

class ListViewSeparatedExample extends StatelessWidget {
  ListViewSeparatedExample({super.key});

  final List<People> contacts = [
    People(name: "Winnie", email: "winnie@gmail.com", gender:"female"),
    People(name: "Jack", email: "jack@gmail.com", gender:"male"),
    People(name: "Patrick", email: "patrick@gmail.com", gender:"male"),
    People(name: "Patricia", email: "patricia@gmail.com", gender:"female"),
    People(name: "Jason", email: "jason@gmail.com", gender:"male"),
    People(name: "Penny", email: "penny@gmail.com", gender:"female")

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: contacts.length ,
        itemBuilder: (context, index){
          return Padding(
              padding: EdgeInsets.all(12),
              child: ListTile(
              tileColor: Color(0xff52c5f3),
              leading: contacts[index].gender == "female" ? Icon(Icons.female) : Icon(Icons.male),
              title: Text(contacts[index].name!),
              subtitle: Text(contacts[index].email!),
              trailing: Icon(Icons.arrow_right),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.blue, width: 1),
              ),
              onTap: (){
                print(contacts[index].name!);
              },
            ),
          );
        },
      separatorBuilder: (context, index){
        return SizedBox(height: 2,);
      },
    );
  }
}









