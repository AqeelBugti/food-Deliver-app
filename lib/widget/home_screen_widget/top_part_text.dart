import 'package:flutter/material.dart';

class TopPartText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enjoy Your Meal with',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Your Favourite Food',
            style: Theme.of(context).textTheme.headline1
          ),
        ],
      ),
    );
  }
}
