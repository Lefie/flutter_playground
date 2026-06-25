import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key, required this.profiles});

  final List<Map<String, dynamic>> profiles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) {
      return ListTile(
        leading: profiles[index]["dog_person"]? Icon(Icons.pets_outlined): Icon(Icons.not_interested),
        title: Text(profiles[index]["name"]),
        subtitle: Text(profiles[index]["email"]),
      );
    }, separatorBuilder: (context, index){
      return SizedBox(height: 20,);
    }, itemCount: profiles.length);
  }
}