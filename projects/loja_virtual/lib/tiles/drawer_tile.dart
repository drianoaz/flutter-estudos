import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.black,
                size: 32.0,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
