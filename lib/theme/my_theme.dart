import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    primaryColor: Color.fromARGB(255, 251, 4, 4),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blueAccent
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style:ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          MyColors.primaryColor,
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            color: MyColors.textligth
          ),
        ),
      ),
    ),
  );


  static final darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 247, 0, 0)
    )
  );
}