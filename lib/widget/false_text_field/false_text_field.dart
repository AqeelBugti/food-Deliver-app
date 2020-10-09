import 'package:flutter/material.dart';

class FalseTextFeild extends StatelessWidget {
  final String title;
  final IconData icon;
  FalseTextFeild({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    {
      return Container(
        color: Theme.of(context).textTheme.button.color,
        margin: EdgeInsets.all(15),
        height: 58,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).textTheme.bodyText2.color),
              SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18, letterSpacing: 1, color: Colors.black54),
              )
            ],
          ),
        ),
      );
    }
  }
}
