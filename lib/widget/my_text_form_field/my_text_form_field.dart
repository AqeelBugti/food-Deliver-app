import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
final IconData iconData;
final bool obscureText;
final String hintText;
final TextEditingController controller;
final Color color;
final TextInputType keyboardType;
MyTextFormField({@required this.color, @required this.hintText ,@required this.controller ,@required this.iconData,@required this.keyboardType,@required this.obscureText,});
  @override
  Widget build(BuildContext context) {
  return Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          hintText: hintText,
          prefixIcon: Icon(iconData,color:  Theme.of(context).textTheme.bodyText2.color,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
 
  
