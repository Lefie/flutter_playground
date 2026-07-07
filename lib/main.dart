import 'package:flutter/material.dart';


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
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xffa6003b),
              brightness: Brightness.light
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xffa6003b),
              foregroundColor: Colors.white
          ) ,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffa6003b),
              foregroundColor: Colors.white
            ),
          )

        ),
      home: StyledHomeScreen(),
    );
  }
}

class StyledHomeScreen extends StatelessWidget {

  const StyledHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hulu"),
      ),
      body: SingleChildScrollView(child:
          Column(children: [
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary ,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: (){
                  },
                  child: Text("All")),

              ],
            ),
            Text("Test", style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold
                ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 120,
              height: 120,
              color: Theme.of(context).colorScheme.tertiaryContainer,
              child: Center(child: Text(
                "some quotes people say",
                style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text("something")),
            SizedBox(height: 10,),



        ],),)
    );

  }


}





