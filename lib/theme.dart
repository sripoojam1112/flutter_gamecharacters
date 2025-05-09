import 'package:flutter/material.dart';
// 'static' fields in a class are just the fields which can be directly accessed from the class, 
//without making a new instance of it

class AppColors{
  static Color primaryColor = const Color.fromARGB(255, 239, 30, 15);
  static Color primaryAccent = const Color.fromARGB(255, 113, 12, 12);
  static Color secondaryColor = const Color.fromARGB(255, 73, 70, 70);
  static Color secondaryAccent = const Color.fromARGB(255, 48, 48, 48);
  static Color titleColor = const Color.fromARGB(255, 239, 238, 238);
  static Color textColor = const Color.fromARGB(255, 204, 202, 202);
  static Color successColor = const Color.fromARGB(255, 24, 190, 143);
  static Color highlightColor = const Color.fromARGB(255, 245, 210, 72);
}

/*ThemeData
It's a class provided by Flutter in the Material library.
It defines colors, fonts, icon themes, button styles, text styles, etc.
You use it to customize the look and feel of your app globally.
myTheme is a variable of type ThemeData
*/

ThemeData myTheme = ThemeData(
  // seed color
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    ),

    // scaffold color
    scaffoldBackgroundColor: AppColors.secondaryAccent,

    // appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.textColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontSize: 16,
        letterSpacing: 1,
      ),
      headlineMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    ),

    // CARD THEME
    cardTheme: CardTheme(
      color: AppColors.secondaryColor.withOpacity(0.5),
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(),
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 14)
    ),

    // INPUT DECORATION THEME
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondaryColor.withOpacity(0.5),
      border: InputBorder.none,
      labelStyle: TextStyle(color: AppColors.textColor),
      prefixIconColor: AppColors.textColor,
    ),

    // DIALOGUE THEME
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.secondaryAccent,
      surfaceTintColor: Colors.transparent,
    ),

    
);

