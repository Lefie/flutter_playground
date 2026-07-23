import 'package:flutter/material.dart';

class StyledHomeScreen extends StatefulWidget{

  const StyledHomeScreen({super.key});

  State<StyledHomeScreen> createState() => StyledHomeScreenState();

}

class StyledHomeScreenState extends State<StyledHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1000,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Welcome Home",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 20,),
                Text("Elevate your daily routine with footwear engineered for your lifestyle. Crafted from durable, breathable materials, these shoes blend premium all-day cushion with a sleek, modern aesthetic. Perfect for active days or casual nights out, they deliver the lightweight support and traction you need to move confidently through every step.",
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height:10),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StyledProductScreen()));
                }, child: Text("See Products!"))


              ],
            ),
          ),
        ),
      ),
    );
  }
}


class StyledProductScreen extends StatefulWidget{

  const StyledProductScreen({super.key});

  State<StyledProductScreen> createState() => StyledProductScreenState();

}

class StyledProductScreenState extends State<StyledProductScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1000,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Welcome to Product Page",
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: 20,),
                Container(
                  width:500,
                  height:400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage('assets/sneakers.jpg', ),
                          fit: BoxFit.cover
                      )
                  ) ,
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Home"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
