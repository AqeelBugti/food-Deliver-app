import 'package:flutter/material.dart';

class CartModel {
  final String image;
  final String title;
  final double price;
  final int quantity;

  CartModel(
      {@required this.quantity,
      @required this.price,
      @required this.title,
      @required this.image});
}
