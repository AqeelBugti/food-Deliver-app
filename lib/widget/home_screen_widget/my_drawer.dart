import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function whenPress;
  final String title;
  final IconData iconData;

  MyDrawer({this.whenPress, this.iconData, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenPress,
      child: ListTile(
        leading: Icon(
          iconData,
          size: 30,
          color: Theme.of(context).textTheme.bodyText2.color,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2.color,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
