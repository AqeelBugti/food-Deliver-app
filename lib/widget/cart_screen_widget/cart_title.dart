import 'package:flutter/material.dart';

class CartTitle extends StatelessWidget {
  final String title;

  CartTitle({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        color: Theme.of(context).textTheme.bodyText2.color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
