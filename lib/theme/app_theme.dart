import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 0, 175, 214);
  static const Color btnMain = Color.fromARGB(255, 52, 223, 69);
  static const Color chartToday = primary;
  static const Color chartLastWeek = Color.fromARGB(255, 0, 101, 123);
  static const Color bold = Colors.black;
  static const Color normal = Colors.black87;
  static const Color light = Colors.black45;
  static const Color backgroundRecord = Color.fromARGB(250, 220, 220, 220);
  static const Color backgroundNavigation = Color.fromARGB(250, 240, 240, 240);
  static const Color healtyRecord = Color.fromARGB(255, 201, 255, 200);
  static const Color regularRecord = Color.fromARGB(255, 244, 245, 179);
  static const Color dangerRecord = Color.fromARGB(255, 231, 145, 145);
  static const Color heart = Color.fromARGB(255, 241, 23, 23);
  static const Color unselectedIcon = Colors.black45;

  static const double h1 = 80;
  static const double h2 = 50;
  static const double h3 = 40;
  static const double title = 20;
  static const double subtitle = 18;
  static const double body = 14;

  static final ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          color: Colors.white, foregroundColor: light, elevation: 0),
      primaryColor: normal,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppTheme.backgroundNavigation,
          selectedIconTheme: IconThemeData(color: primary),
          unselectedIconTheme: IconThemeData(color: unselectedIcon),
          type: BottomNavigationBarType.fixed),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: btnMain, elevation: 0));
}
