import 'package:flutter/material.dart';

class ListViewBuilderExample extends StatelessWidget {
  const ListViewBuilderExample({super.key, required this.profiles} );

  final List<Map<String, dynamic>> profiles;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: profiles[index]["dog_person"]? Icon(Icons.pets_outlined): Icon(Icons.not_interested),
            title: Text(profiles[index]["name"]),
            subtitle: Text(profiles[index]["email"]),
          );
        },
        shrinkWrap: true,
     );

  }
}


