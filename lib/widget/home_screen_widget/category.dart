import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String title;

  CategoryWidget({@required this.image, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  image,
                ),
              ),
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.caption.color,
            ),
          )
        ],
      ),
    );
  }
}
