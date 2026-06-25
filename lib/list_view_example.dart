import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width:300,
        child: ListView(
          children: [
            ListTile(
                onTap: (){
                  print("Alarm");
                },
                leading: Icon(Icons.access_alarm),
                title: Text('Alarm'),
                textColor: Colors.white,
                iconColor: Colors.white,
                tileColor: Color(0xFF113183),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                )
            ),
            SizedBox(height: 5,),
            ListTile(
                onTap: (){
                  print("Add something");
                },
                leading: Icon(Icons.add_box),
                title: Text('Box'),
                textColor: Colors.white,
                iconColor: Colors.white,
                tileColor: Color(0xFF113183),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                )
            ),
            SizedBox(height: 5,),
            ListTile(
                onTap: (){
                  print("Alert");
                },
                leading: Icon(Icons.add_alert),
                title: Text('Alert'),
                textColor: Colors.white,
                iconColor: Colors.white,
                tileColor: Color(0xFF113183),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                )
            ),
          ],
        ),
      ),
    );
  }
}