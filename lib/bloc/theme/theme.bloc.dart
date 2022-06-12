import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:multi_bloc_provider/bloc/theme/theme.state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            brightness: Brightness.light,
            floatingActionButtonThemeData: FloatingActionButtonThemeData(
              foregroundColor: Colors.white,
            )));

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  toggleTheme() {
    emit(
      state.brightness == Brightness.light ? darkTheme() : lightTheme(),
    );
  }

  darkTheme() {
    emit(ThemeDark(
        brightness: Brightness.dark,
        floatingActionButtonThemeData:
            FloatingActionButtonThemeData(foregroundColor: Colors.black)));
  }

  floatingbuttoncolor() {
    emit(ThemeDark(
        brightness: Brightness.dark,
        floatingActionButtonThemeData:
            FloatingActionButtonThemeData(foregroundColor: Colors.amber)));
  }

  lightTheme() {
    emit(ThemeLight(
        brightness: Brightness.light,
        floatingActionButtonThemeData:
            FloatingActionButtonThemeData(foregroundColor: Colors.white)));
  }
}
