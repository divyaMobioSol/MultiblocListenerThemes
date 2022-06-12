import 'package:flutter/material.dart';

class ThemeState {
  final Brightness? brightness;
  final FloatingActionButtonThemeData? floatingActionButtonThemeData;
  ThemeState({this.brightness, this.floatingActionButtonThemeData});
}

class ThemeLight extends ThemeState {
  final Brightness? brightness;
  final FloatingActionButtonThemeData? floatingActionButtonThemeData;
  ThemeLight({this.brightness, this.floatingActionButtonThemeData});
}

class ThemeDark extends ThemeState {
  final Brightness? brightness;
  final FloatingActionButtonThemeData? floatingActionButtonThemeData;

  ThemeDark({this.brightness, this.floatingActionButtonThemeData});
}
