import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
 
 final String title;
 final Function whenPress;
 final Color color;
 final double elevation;
  MyRaisedButton({@required this.elevation ,@required this.color, @required this.title,@required this.whenPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(15),
      width: double.infinity,
      child: RaisedButton(
        elevation: elevation,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            letterSpacing: 5,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: color,
        onPressed: whenPress
      ),
    );
  }
}
