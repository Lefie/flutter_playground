import 'package:flutter/material.dart';

class SocialMediaPost extends StatefulWidget {

  @override
  State<SocialMediaPost> createState() => SocialMediaPostState() ;

}

class SocialMediaPostState extends State<SocialMediaPost> {

  int _likes = 0;

  void incrementLikes() {
    setState(() {
      _likes ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: Color(0xFF4a4a4a),
          borderRadius: BorderRadius.circular(15),
          border:Border.all(
            color: Color(0xff717171),
            width: 1.0,
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 32),
                child: Row(
                children: [
                  Icon(Icons.person, size: 23,),
                  SizedBox(width: 10,),
                  Text("flutter_fan22",
                      style: TextStyle(
                          color:Colors.white,
                          fontSize: 14,
                        fontWeight: FontWeight.w800
                      )),
                ],
              ) ,),
              SizedBox(height: 15,),
              Text("Just deployed my first Flutter widget tree without a single overflow error 🎉",
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800
                  )),
              SizedBox(height: 15,),
              Divider(
                height: 1,
              ),
              Row(
                children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, size: 25,),
                  color: Colors.white,
                  onPressed: () {
                    incrementLikes();
                  },
                ),
                SizedBox(width: 5,),
                Text("${_likes}", style: TextStyle(color:Colors.white))
              ],),
          ],
        ),
        ),
        ),
        ), );
  }
}