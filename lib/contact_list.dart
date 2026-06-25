import 'package:flutter/material.dart';

// data model
class Contact {
  final String name;
  final String email;
  final String phone;

  Contact(this.name, this.email, this.phone);
}

// widget that receives a list of contacts and display data as list
class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];

              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.email),
                onTap: () {
                  print("navigate to this contact detail");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactDetailScreen(contact: contact)));
                },
              );
            })
    );
  }
}

// widget that displays one single contact detail
class ContactDetailScreen extends StatelessWidget {

  const ContactDetailScreen({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              contact.name,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 15,),
            Text('Email: ${contact.email}'),
            Text('Phone: ${contact.phone}'),
          ],
        ) ,
      ),

    );
  }
}