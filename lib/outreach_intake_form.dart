import 'package:flutter/material.dart';
import 'outreach_form.dart';

class IntakeForm extends StatefulWidget {
  const IntakeForm({super.key});

  @override
  State<IntakeForm> createState() => IntakeFormState();

}

class IntakeFormState extends State<IntakeForm> {
  final _intakeFormKey = GlobalKey<FormState>();
  var _formData = OutreachFormData();



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
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder()
                ),
                onSaved: (String? value){
                  _formData.fullName = value ?? '';
                },
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(child:
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "25",
                        labelStyle: TextStyle(color: Colors.white70)
                    ),
                    onSaved: (String? value){
                        _formData.age = value?? '';
                    },
                  ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child:
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "(555)123-4455",
                        labelStyle: TextStyle(color: Colors.white70)
                    ),
                    onSaved: (String? value) {
                      _formData.phoneNumber = value ?? '';
                    },
                  ),),
                ],),
              SizedBox(height: 15,),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white70),
                   hintText: "name@gmail.com"
                ),
                onSaved: (String? value) {
                  _formData.email = value ?? '';
                },
              ),
              SizedBox(height: 25,),
              DropdownButton<String>(
                dropdownColor: Colors.black38,
                style: TextStyle(color: Colors.white70),
                focusColor: Colors.transparent,
                hint: Text("Select your community", style: TextStyle(color: Colors.white70)),
                value: _formData.community,
                items: [
                DropdownMenuItem(value: 'ya_group' , child: Text("Young Adult Group")),
                DropdownMenuItem(value: 'fam_min',child: Text("Family Ministry")),
                DropdownMenuItem(value: 'visitor',child: Text("Visiting from Another Community")),
                ],
              onChanged: (String? value){
                  setState(() {
                    _formData.community = value ?? "";
                  });
                  print("drop down ${value} ${_formData.community}");
              }
              ),
              SizedBox(height: 25,),
              Text("Have you volunteered with our outreach before? ",
                  style: TextStyle(fontSize: 16, color:Colors.white70)),

              Column(children: [
                RadioListTile<String>(
                  title: Text("First time volunteering",
                      style:TextStyle(color: Colors.white, fontSize: 12)),
                    value: "first_time" ,
                    groupValue: '${_formData.experience}',
                    onChanged: (String? value){
                      print(value);
                      setState(() {
                        _formData.experience = value;
                      });
                 }),
                RadioListTile<String>(
                    title: Text("Volunteered before, not recently",
                        style:TextStyle(color: Colors.white,fontSize: 12)),
                    value: 'occasional' ,
                    groupValue: '${_formData.experience}',
                    onChanged: (String? value){
                      print(value);
                      setState(() {
                        _formData.experience = value;
                      });
                    }),
                RadioListTile<String>(
                    title: Text("Regular Outreach Volunteer ",
                    style:TextStyle(color: Colors.white,fontSize: 12)),
                    value: 'regular' ,
                    groupValue: '${_formData.experience}',
                    onChanged: (String? value){
                      setState(() {
                        _formData.experience = value;
                      });
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
                      value: _formData.tasks.contains("Preparing and serving meals"),
                      onChanged: (value){
                        print("check ${value}");
                        setState(() {
                          if (_formData.tasks.contains("Preparing and serving meals")) {
                            _formData.tasks.remove("Preparing and serving meals");
                          }else {
                            _formData.tasks.add("Preparing and serving meals");
                          }
                        });
                      }),
                  CheckboxListTile(
                      title: Text("Sorting and packing supply bags",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 12
                          )),
                      value: _formData.tasks.contains("Sorting and packing supply bags"),
                      onChanged: (value){
                        setState(() {
                          if (_formData.tasks.contains("Sorting and packing supply bags")) {
                            _formData.tasks.remove("Sorting and packing supply bags");
                          }else {
                            _formData.tasks.add("Sorting and packing supply bags");
                          }
                        });
                      }),
                  CheckboxListTile(
                      title: Text("Conversation and companionship", style: TextStyle(color:Colors.white, fontSize: 12)),
                      value: _formData.tasks.contains("Conversation and companionship"),
                      onChanged: (value){
                        setState(() {
                          if (_formData.tasks.contains("Conversation and companionship")) {
                            _formData.tasks.remove("Conversation and companionship");
                          }else {
                            _formData.tasks.add("Conversation and companionship");
                          }
                        });
                      }),
                  CheckboxListTile(
                      title: Text("Driving or transport", style: TextStyle(color:Colors.white, fontSize: 12)),
                      value: _formData.tasks.contains("Driving or transport"),
                      onChanged: (value){
                        setState(() {
                          if (_formData.tasks.contains("Driving or transport")) {
                            _formData.tasks.remove("Driving or transport");
                          }else {
                            _formData.tasks.add("Driving or transport");
                          }
                        });
                      }),
                ],
              ),
              Divider(color: Color(0xFF4a4a4a)),
              SizedBox(height: 10,),
              SwitchListTile(
                  title: Text("Comfortable with early mornings", style: TextStyle(color:Colors.white, fontSize: 17)),
                  subtitle: Text("we gather at 6:30am Saturday mornings", style: TextStyle(color:Color(
                      0xff8e8e8e), fontSize: 12)),
                  value: _formData.earlyMorningsPreference,
                  onChanged: (bool? value){
                    setState(() {
                      if(_formData.earlyMorningsPreference) {
                        _formData.earlyMorningsPreference = false;
                      }else {
                        _formData.earlyMorningsPreference = true;
                      }
                    });
                  },
                ),
             SwitchListTile(
                title: Text("Send me weekly reminders", style: TextStyle(color:Colors.white, fontSize: 17)),
                subtitle: Text("Text the night before each shift", style: TextStyle(color:Color(
                    0xff8e8e8e), fontSize: 12)),
                value: _formData.weeklyReminderPreference,
                onChanged: (bool? value){
                  setState(() {
                    if (_formData.weeklyReminderPreference) {
                      _formData.weeklyReminderPreference = false;
                    }else {
                      _formData.weeklyReminderPreference = true;
                    }
                  });
                },
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
                onSaved: (String? value){
                  setState(() {
                    _formData.comments = value ?? "";
                  });
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    final isValid = _intakeFormKey.currentState!.validate();
                    if (isValid) {
                      _intakeFormKey.currentState!.save();
                      print(_formData);
                      _intakeFormKey.currentState!.reset();
                      setState(() {
                        _formData = OutreachFormData();
                      });
                    }
                  },
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
              Column(
                children: [
                  Text("${_formData.fullName}", style: TextStyle(color: Colors.white54)),
                  Text("${_formData.age}", style: TextStyle(color: Colors.white54)),
                ],
              )
            ],
          ),
      ),
    );
  }
}