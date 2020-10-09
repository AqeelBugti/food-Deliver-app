import 'package:flutter/material.dart';

class CartPrice extends StatelessWidget {
  final double price;

  CartPrice({@required this.price});
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${price.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.bodyText2.color,
      ),
    );
  }
}
