import 'package:flutter/material.dart';
import '../service/auth_service.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  State<SignUpScreen> createState() => SignUpScreenState();

}

class SignUpScreenState extends State<SignUpScreen> {

  final _signupFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  Future<void> _submit() async{
    print("info submitted ${_usernameController.text.trim()}, ${_emailController.text.trim()}, ${_passwordController.text.trim()}");
    await _authService
        .userSignUp(email: _emailController.text.trim(), password: _passwordController.text.trim(), username:_usernameController.text.trim());
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _signupFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top:20,bottom: 20, left:50,right:50),
              child: Container(
                width: double.infinity,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Welcome!", style: TextStyle(fontSize: 28 ),),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "winnie",
                      enabledBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color:Color(0xff098cff))
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "winnie@gmail.com",
                      helperText: "Sign up with your email",
                      enabledBorder:UnderlineInputBorder(
                        borderSide: BorderSide(color:Color(0xff098cff))
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _passwordController,
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
                      onPressed: _submit, child: Text("Register")),
                  ElevatedButton(onPressed: _authService.signOut, child: Text("Logout"))
                ],
                ),
              ),
            ),
          )),
    );
  }
}