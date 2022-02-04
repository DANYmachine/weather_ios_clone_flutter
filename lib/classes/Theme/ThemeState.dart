import 'package:flutter/material.dart';

abstract class ThemeState {
  var fontLightColor;
  var fontDarkColor;
  var buttonLightColor = Colors.white;
  var buttonDarkColor;
  var primaryLightColor = Colors.lightBlue.withOpacity(0.7);
  var primaryDarkColor;
  var secondaryLightColor;
  var secondaryDarkColor;
}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}
