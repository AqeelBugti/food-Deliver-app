import 'package:flutter/material.dart';

//const kcolor = Color(0xff282828);

class CartImage extends StatelessWidget {
  final String image;

  CartImage({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).backgroundColor.withOpacity(0.5),
              offset: Offset(0, 2),
            )
          ],
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
