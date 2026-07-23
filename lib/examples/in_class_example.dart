import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xFF8FCDF4),
              padding: EdgeInsets.only(top:10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("A"),
                  Text("B"),
                  Text("C"),
                ],
              ),
            ),
            Container(
              color: Color(0xFF8FCDF4),
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              margin: EdgeInsets.only(top:10, bottom: 10),
              child:
              Text("Welcome Home!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),
            Container(
              color: Color(0xFF89DD27),
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child:
              Text("Welcome Home!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Text Widget 1"),
            ),
            Text("Text Widget 2"),

            Container(
              color: Color(0xFF89DD27),
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child:
              Text("Welcome Home!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Winnie"),
              subtitle: Text("winnie@gmail.com"),
              tileColor: Color(0xFF8FCDF4),
              trailing: Icon(Icons.arrow_right),
              onTap: (){
                print("Tapped!");
              },
            )
          ],
        ),
      ),
    );
  }
}
