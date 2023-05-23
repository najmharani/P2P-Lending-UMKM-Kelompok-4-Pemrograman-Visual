import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE4F7F3),
  100: Color(0xFFBAEBE1),
  200: Color(0xFF8DDECE),
  300: Color(0xFF5FD0BA),
  400: Color(0xFF3CC6AB),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF17B694),
  700: Color(0xFF13AD8A),
  800: Color(0xFF0FA580),
  900: Color(0xFF08976E),
});
const int _primaryPrimaryValue = 0xFF1ABC9C;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFC3FFEC),
  200: Color(_primaryAccentValue),
  400: Color(0xFF5DFFCC),
  700: Color(0xFF44FFC4),
});
const int _primaryAccentValue = 0xFF90FFDC;
