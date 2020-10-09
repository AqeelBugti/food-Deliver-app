import 'package:fast_food/provider/more_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MoreCategory delete = Provider.of<MoreCategory>(context);

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: IconButton(
        splashColor: Theme.of(context).accentColor,
        highlightColor: Theme.of(context).accentColor,
        icon: Icon(
          Icons.close,
        ),
        onPressed: () {
          delete.remove(0);
        },
      ),
    );
  }
}
