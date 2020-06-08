import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot document;

  CategoryTile(this.document);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(document.data["icon"]),
      ),
      title: Text(document.data["title"]),
      trailing: Icon(
        Icons.keyboard_arrow_right
      ),
      onTap: () {
        print("tap");
      },
    );
  }
}
