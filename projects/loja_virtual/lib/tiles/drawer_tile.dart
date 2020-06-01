import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  DrawerTile({
    @required this.icon,
    @required this.text,
    @required this.pageController,
    @required this.page,
  });

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: pageController.page.round() == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
                size: 32.0,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: pageController.page.round() == page
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
