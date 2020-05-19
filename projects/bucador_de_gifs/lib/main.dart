import 'package:flutter/material.dart';
import 'package:bucador_de_gifs/ui/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Colors.white
          ))
        )
      ),
      home: HomePage(),
    ),
  );
}
