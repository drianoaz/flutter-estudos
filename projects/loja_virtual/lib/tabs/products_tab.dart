import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja_virtual/tiles/category_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final tiles = snapshot.data.documents.map((document) {
            return CategoryTile(document);
          }).toList();

          final divideTiles = ListTile.divideTiles(
            tiles: tiles,
            color: Colors.grey[500],
          ).toList();

          return ListView(
            children: divideTiles,
          );
        }
      },
    );
  }
}
