import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  static const List<Contact> contacts = [Contact(first_name: "Lemon", last_name: "Ruan", phone_number: "9299292929",),
    Contact(first_name: "Tess", last_name: "Jackson", phone_number: "9299292929",),
    Contact(first_name: "Tom", last_name: "Holland", phone_number: "9299292929",),
    Contact(first_name: "Anne", last_name: "Ramirez", phone_number: "9299292929",),];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          color: Colors.blue[200] ),
      child: ListView.separated(
        itemBuilder: (context, index) => contacts[index],
        separatorBuilder: (context, index) => Divider(color: Colors.grey[100]),
        itemCount: contacts.length),
    );
  }
}

//contact
class Contact extends StatelessWidget {
  final String first_name;
  final String last_name;
  final String phone_number;

  const Contact({
    super.key,
    required this.first_name,
    required this.last_name,
    required this.phone_number
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF9CBEDA), //
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width: 300,
      child: ListTile(
      leading: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Text("${first_name[0].toUpperCase()}${last_name[0].toUpperCase()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),),
      title: Text("$first_name $last_name"),
      subtitle: Text(phone_number),
      trailing: IconButton(onPressed: (){print("add $first_name");}, icon: Icon(Icons.add)),
      onTap: (){
        print("Tapped $first_name");
     },
    ),
    );
  }


}