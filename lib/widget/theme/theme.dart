import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();
  static const Color _lightBlack = Color(0xff2b2b2b);
  static const Color _white = Colors.white;
  static const Color _greyColor = Colors.grey;
  static const Color starColor = Colors.yellow;

  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: _lightBlack,
    backgroundColor: _greyColor,
    appBarTheme: AppBarTheme(
      color: _lightBlack,
      iconTheme: IconThemeData(
        color: _white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightBlack,
      secondary: starColor,
    ),
    iconTheme: IconThemeData(
      color: _white,
    ),
    textTheme: _textWhiteColor,
  );

  static final TextTheme _textWhiteColor = TextTheme(
      headline1: _lightScreenBlack,
      bodyText1: enjoyyourmeal,
      bodyText2: searchLabalText,
      button: searchColor,
      caption: categoryText,
      headline2: bottomPrice);
  static final TextStyle _lightScreenBlack = TextStyle(
    color: _white,
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle enjoyyourmeal = TextStyle(
    fontSize: 18,
    color: Colors.white54,
  );
  static final TextStyle searchLabalText =
      TextStyle(fontSize: 20, color: _white);
  static final TextStyle searchColor = TextStyle(
    color: Color(
      0xff3a3e3e,
    ),
  );
  static final TextStyle categoryText = TextStyle(
    fontSize: 18,
    color: _white,
  );
  static final TextStyle bottomPrice = TextStyle(
    fontSize: 15,
    color: _white,
    fontWeight: FontWeight.bold,
  );

  //////// LightTheme....
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff272d3a), 
    //Color(0xff6f80a4),
    backgroundColor: Color(
      0xff55637f,
    ),
    appBarTheme: AppBarTheme(
      color: Color(0xff272d3a),
      iconTheme: IconThemeData(
        color: _white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Color(
      0xff272d3a,
    ),
      secondary: starColor,
    ),
    iconTheme: IconThemeData(
      color: _white,
    ),
    textTheme: _texteWhiteColor,
  );

  static final TextTheme _texteWhiteColor = TextTheme(
      headline1: _lighteScreenBlack,
      bodyText1: enjoyryourmeal,
      bodyText2: searchhLabalText,
      button: searchhColor,
      caption: categoryyText,
      headline2: bottommPrice);
  static final TextStyle _lighteScreenBlack = TextStyle(
    color: _white,
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle enjoyryourmeal = TextStyle(
    fontSize: 18,
    color: Colors.white54,
  );
  static final TextStyle searchhLabalText = TextStyle(
    fontSize: 20,
    color: _white,
  );
  static final TextStyle searchhColor = TextStyle(
    color:Color(0xff495368),
    //  Color(
    //   0xff55637f,
    // ),
  );
  static final TextStyle categoryyText = TextStyle(
    fontSize: 18,
    color: _white,
  );
  static final TextStyle bottommPrice = TextStyle(
    fontSize: 15,
    color: _white,
    fontWeight: FontWeight.bold,
  );
}
