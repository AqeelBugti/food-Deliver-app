import 'package:fast_food/widget/cart_screen_widget/cart_image.dart';
import 'package:fast_food/widget/cart_screen_widget/cart_price.dart';
import 'package:fast_food/widget/cart_screen_widget/cart_title.dart';
import 'package:fast_food/widget/cart_screen_widget/my_close_button.dart';
import 'package:flutter/material.dart';

class SingleCartItem extends StatefulWidget {
  final String image;
  final String title;
  final double price;
  int quantity;
  SingleCartItem({@required this.quantity, this.price, this.title, this.image});

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  @override
  Widget build(BuildContext context) {
    double price = widget.price * widget.quantity;

    return Container(
      margin: EdgeInsets.all(10),
      height: 180,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Row(
            children: [
              CartImage(
                image: widget.image,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CartTitle(
                                title: widget.title,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).textTheme.bodyText2.color,
                                ),
                              ),
                              CartPrice(
                                price: price,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              splashColor: Theme.of(context).colorScheme.primary,
                              highlightColor: Theme.of(context).colorScheme.primary,
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Theme.of(context).textTheme.bodyText2.color,
                                size: 40,
                              ),
                              onPressed: () {
                                if (widget.quantity > 1) {
                                  setState(() {
                                    widget.quantity--;
                                  });
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 8),
                              child: Text(
                                widget.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).textTheme.bodyText2.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              splashColor: Theme.of(context).colorScheme.primary,
                              highlightColor: Theme.of(context).colorScheme.primary,
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Theme.of(context).textTheme.bodyText2.color,
                                size: 40,
                              ),
                              onPressed: () {
                                if (widget.quantity < 15) {
                                  setState(() {
                                    widget.quantity++;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          MyCloseButton(),
        ],
      ),
    );
  }
}
