import 'package:flutter/material.dart';

class VolunteerForm extends StatefulWidget {
  const VolunteerForm({super.key});

  @override
  State<VolunteerForm> createState() => VolunteerFormState();

}

class VolunteerFormState extends State<VolunteerForm> {

  final _volunteer_form_key = GlobalKey<FormState>();
  String _first_name = "";
  String _last_name = "";
  String _age = "" ;
  String _comments = "";
  bool _is_checked_option1 = false;
  bool _is_checked_option2 = false;
  List<String> _role = [] ;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _volunteer_form_key,
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextFormField(
                decoration: InputDecoration(
                  labelText: "First Name",
                  hintText: "Daisy",
                ),
                onSaved: (value) {
                  setState(() {
                    _first_name = value!;
                  });
                  print("saving $value");
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  return null;
                }
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "Johnson"
                ),
                onSaved: (value) {
                  setState(() {
                    _last_name = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  return null;
                }
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Age",
                    hintText: "18"
                ),
                onSaved: (value) {
                  setState(() {
                    _age = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  final _age = int.tryParse(value);
                  if ( _age == null || _age < 0 ) {
                    return "Please enter a valid age";
                  }

                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          Text("Volunteer Role", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: CheckboxListTile(
               title: Text("Soup Kitchen Cook"),
                value: _is_checked_option1,
                onChanged: (bool? value){
                 print(value);
                 setState(() {
                   _is_checked_option1 = value!;
                   if(value) {
                     _role.add("Soup Kitchen Cook");
                   }else {
                     _role.remove("Soup Kitchen Cook");
                   }
                 });
                }),
          ),
          SizedBox(
            width: 300,
            child: CheckboxListTile(
                title: Text("Serving Food"),
                value: _is_checked_option2,
                onChanged: (bool? value){
                  setState(() {
                    _is_checked_option2 = value!;
                    if(value) {
                      _role.add("Serving Food");
                    }else {
                      _role.remove("Serving Food");
                    }
                  });

                }),

          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: TextFormField(
              maxLines:2,
              decoration: InputDecoration(
                  labelText: "Leave any comments or questions"
              ),
              onSaved: (value){
                setState(() {
                  _comments = value!;
                });
              },
            ) ,
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            _volunteer_form_key.currentState!.save(); // save data into variables
            if(_volunteer_form_key.currentState!.validate()) {
              print("values: ${_first_name} ${_last_name} and they are ${_age} years old");
              print("role(s): ${_role}");
              print("comments: ${_comments}");
            }
          }, child: Text("Submit")),
        ],
      ),
    );
  }
}
