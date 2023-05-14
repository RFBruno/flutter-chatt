import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryValue, <int, Color>{
  50: Color(0xFFE9F8E5),
  100: Color(0xFFC7ECBF),
  200: Color(0xFFA2E094),
  300: Color(0xFF7DD469),
  400: Color(0xFF61CA48),
  500: Color(_primaryValue),
  600: Color(0xFF3EBB24),
  700: Color(0xFF36B31E),
  800: Color(0xFF2EAB18),
  900: Color(0xFF1F9E0F),
});
const int _primaryValue = 0xFF45C128;

const MaterialColor accent = MaterialColor(_accentValue, <int, Color>{
  100: Color(0xFFD2FFCE),
  200: Color(_accentValue),
  400: Color(0xFF75FF68),
  700: Color(0xFF5DFF4E),
});
const int _accentValue = 0xFFA3FF9B;


final ThemeData appTheme = ThemeData(
  primaryColor: primary,  
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: primary,
    accentColor: accent,
    brightness: Brightness.dark,
  ).copyWith(
    surface: primary,
    onSurface: Colors.black,
  ),
);