import 'package:flutter/material.dart';
import 'package:news/core/themes/dark_theme.dart';
import 'package:news/core/themes/light_theme.dart';

enum AppTheme {
  darkTheme(Icons.dark_mode_outlined),
  lightTheme(Icons.light_mode_outlined);

  final IconData icon;

  const AppTheme(this.icon);
}

final Map appThemeData = {
  AppTheme.darkTheme: darkTheme,
  AppTheme.lightTheme: lightTheme,
};
