import 'package:flutter/material.dart';

class TitlePriceWidget extends StatelessWidget {
final  String title;
final  double price;
  TitlePriceWidget({@required this.title,@required this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline2
        ),
        Text(
          '\$$price',
          style: Theme.of(context).textTheme.headline2 
        ),
      ],
    );
  }
}
