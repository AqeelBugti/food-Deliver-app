import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  _star({
    context,
  }) {
    return Icon(Icons.star,
        size: 14, color: Theme.of(context).colorScheme.secondary);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _star(context: context),
        _star(context: context),
        _star(context: context),
        _star(context: context),
        _star(context: context),
      ],
    );
  }
}
