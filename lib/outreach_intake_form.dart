import 'package:flutter/material.dart';

class IntakeForm extends StatefulWidget {
  const IntakeForm({super.key});

  @override
  State<IntakeForm> createState() => IntakeFormState();

}

class IntakeFormState extends State<IntakeForm> {
  final _intakeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _intakeFormKey,
      child: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x80113183),
                ),
                child: Icon(
                  Icons.handshake_rounded,
                  size: 32.0,
                  color: Colors.blueAccent,

                ),
              ),
              SizedBox(height: 15,),
              SizedBox(width: 300, child: Text("Street outreach volunteer Sign-up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  )),
              ),
              SizedBox(height: 10,),
              Text(
                "Join our parish's ministry serving meals, supplies, and companionship to neighbors experiencing homelessness every Saturday morning.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder()
                ),
              ),
               SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(child:
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "25",
                        labelStyle: TextStyle(color: Colors.white70)
                    ),
                  ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child:
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "(555)123-4455",
                        labelStyle: TextStyle(color: Colors.white70)
                    ),
                  ),),
                ],),
              SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white70),
                   hintText: "name@gmail.com"
                ),
              ),
              SizedBox(height: 25,),
              DropdownButton<String>(
                dropdownColor: Colors.black38,
                style: TextStyle(color: Colors.white70),
                focusColor: Colors.transparent,
                hint: Text("Select your community", style: TextStyle(color: Colors.white70)),
                value: "option1",
                items: [
                DropdownMenuItem(value: 'option1' , child: Text("Young Adult Group")),
                DropdownMenuItem(value: 'option2',child: Text("Family Ministry")),
                DropdownMenuItem(value: 'option3',child: Text("Visiting from Another Community")),
                ],
              onChanged: (String? value){
              }
              ),
              SizedBox(height: 25,),
              Text("Have you volunteered with our outreach before? ",
                  style: TextStyle(fontSize: 16, color:Colors.white70)),

              Column(children: [
                RadioListTile<String>(
                  title: Text("First time volunteering",
                      style:TextStyle(color: Colors.white, fontSize: 12)),
                    value: "option1" ,
                    groupValue: 'option1',
                    onChanged: (String? value){
                      print(value);
               }),
                RadioListTile<String>(
                    title: Text("Volunteered before, not recently",
                        style:TextStyle(color: Colors.white,fontSize: 12)),
                    value: 'option2' ,
                    groupValue: 'tbd',
                    onChanged: (String? value){
                      print(value);
                    }),
                RadioListTile<String>(
                    title: Text("Regular Outreach Volunteer ",
                        style:TextStyle(color: Colors.white,fontSize: 12)),
                    value: 'option3' ,
                    groupValue: 'tbd',
                    onChanged: (String? value){
                      print(value);
                    })

              ],),
              SizedBox(height: 25,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Which tasks can you help with?",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, color:Colors.white70)),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  CheckboxListTile(
                    title: Text("Preparing and serving meals", style: TextStyle(color:Colors.white, fontSize: 12)),
                      value: true,
                      onChanged: (value){
                      }),
                  CheckboxListTile(
                      title: Text("Sorting and packing supply bags ",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 12
                          )),
                      value: false,
                      onChanged: (value){
                      }),
                  CheckboxListTile(
                      title: Text("Conversation and companionship", style: TextStyle(color:Colors.white, fontSize: 12)),
                      value: false,
                      onChanged: (value){
                      }),
                  CheckboxListTile(
                      title: Text("Driving or transport", style: TextStyle(color:Colors.white, fontSize: 12)),
                      value: false,
                      onChanged: (value){
                      }),
                ],
              ),
              Divider(color: Color(0xFF4a4a4a)),
              SizedBox(height: 10,),
             SwitchListTile(
                  title: Text("Comfortable with early mornings", style: TextStyle(color:Colors.white, fontSize: 17)),
                  subtitle: Text("we gather at 6:30am Saturday mornings", style: TextStyle(color:Color(
                      0xff8e8e8e), fontSize: 12)),
                  value: true,
                  onChanged: (bool? value){},
                ),
             SwitchListTile(
                title: Text("Send me weekly reminders", style: TextStyle(color:Colors.white, fontSize: 17)),
                subtitle: Text("Text the night before each shift", style: TextStyle(color:Color(
                    0xff8e8e8e), fontSize: 12)),
                value: false,
                onChanged: (bool? value){},
              ),
             SizedBox(height: 15,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Anything else we should know?",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, color:Colors.white70)),
              ),
              SizedBox(height: 15,),
              TextFormField(
                maxLines: 4,
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF4a4a4a),
                  hintText: "Leave any comments",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250,40),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text("Submit sign-up"),
              ),
              SizedBox(height: 20,),
            ],
          ),
      ),
    );
  }
}