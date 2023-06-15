import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color/colors.dart';

ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: primaryColor),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: secondaryColor, fontSize: 22),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        // statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: lightBackgroundColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: secondaryColor,fontWeight: FontWeight.bold,fontSize: 35),
      titleMedium: TextStyle(color: secondaryColor,fontSize: 16,fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),

    ),
    // Bottom nav bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightBackgroundColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      type: BottomNavigationBarType.fixed,
    ), colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
    ).copyWith(onPrimary: secondaryColor, onSecondary: secondaryColor).copyWith(background: lightBackgroundColor));


