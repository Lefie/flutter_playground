import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/home_screen.dart';
import 'package:flutter_playground/screens/sign_up_screen.dart';
import '../service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  State<LoginScreen> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen> {

  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async{
    await _authService.userSignIn(email: _emailController.text.trim() , password: _passwordController.text.trim());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _loginFormKey,
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
                      controller: _emailController,
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
                        onPressed: _submit, child: Text("Sign In")),
                    SizedBox(height: 10,),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()  )
                      );
                    }, child: Text("Don't have an account? Create a new one!"))

                  ],
                ),
              ),
            ),
          )),
    );
  }
}