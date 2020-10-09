import 'package:fast_food/model/cart_maodel.dart';
import 'package:flutter/material.dart';

class OrderingModel {
  final String id;
  final double price;
  final List<CartModel> food;
  final DateTime time;
  OrderingModel({
     this.food,
    @required this.price,
    @required this.time,
    @required this.id,
  });
}
