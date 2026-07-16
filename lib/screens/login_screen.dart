import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  State<LoginScreen> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top:20,bottom: 20, left:50,right:50),
              child: Container(
                width: double.infinity,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Welcome back!", style: TextStyle(fontSize: 28 ),),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "winnie@gmail.com",
                        helperText: "Sign in with your email",
                        enabledBorder:UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xff098cff))
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Passowrd",
                        helperText: "Enter your password",
                        enabledBorder:UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xff098cff))
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                        onPressed: (){
                        }, child: Text("Sign In"))

                  ],
                ),
              ),
            ),
          )),
    );
  }
}