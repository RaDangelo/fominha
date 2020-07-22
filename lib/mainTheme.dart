import 'package:flutter/material.dart';

class MainTheme {
  MainTheme();

  ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Raleway',
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
              fontSize: 16,
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
              fontSize: 16,
            ),
            button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
      // appBarTheme: AppBarTheme(
      //     textTheme: ThemeData.light().textTheme.copyWith(
      //         headline6: TextStyle(
      //             fontFamily: 'OpenSans',
      //             fontSize: 20,
      //             fontWeight: FontWeight.w600))),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     foregroundColor: Colors.white, backgroundColor: Colors.purple),
    );
  }
}
