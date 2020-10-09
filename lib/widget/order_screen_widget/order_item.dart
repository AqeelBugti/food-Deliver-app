import 'package:fast_food/model/ordering_model.dart';
import 'package:fast_food/widget/cart_screen_widget/cart_image.dart';
import 'package:fast_food/widget/cart_screen_widget/cart_price.dart';
import 'package:fast_food/widget/cart_screen_widget/cart_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final OrderingModel order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\$ ${widget.order.price}',
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
            ),
            subtitle: Text(
              DateFormat().format(
                widget.order.time,
              ),
              style: TextStyle(
                color:Theme.of(context).textTheme.bodyText2.color,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                expand ? Icons.expand_less : Icons.expand_more,
                color:Theme.of(context).textTheme.bodyText2.color,
              ),
              onPressed: () {
                setState(
                  () {
                    expand = !expand;
                  },
                );
              },
            ),
          ),
          if (expand)
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: min(widget.order.food.length * 20.0 + 200, 180),
              child: ListView(
                children: widget.order.food.map(
                  (e) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      child: Row(
                        children: [
                          CartImage(image: e.image),
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Theme.of(context).colorScheme.primary,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 150,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CartTitle(
                                            title: e.title,
                                            
                                          ),
                                          Text(
                                            '${e.quantity.toString()} x',
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Theme.of(context).textTheme.bodyText2.color
                                            ),
                                          ),
                                          CartPrice(
                                            price: e.price,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
