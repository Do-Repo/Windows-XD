import 'package:flutter/material.dart';

// + 3 pixels to each fontsize because they weren't looking right.

class FontResources {
// Franklin Gothic is used only for text over 14 point. Franklin Gothic is
// often used for headers, and should never be used for body text.
  var headerStyle = const TextStyle(
      fontFamily: 'Franklin-Gothic', fontSize: 17, fontStyle: FontStyle.normal);

// Tahoma is used as the system's default font. Tahoma should be used
// at 8, 9 or 11 point sizes.
  var defaultStyleSmall = const TextStyle(fontFamily: 'Tahoma', fontSize: 11);

  var defaultStyleMedium = const TextStyle(fontFamily: 'Tahoma', fontSize: 12);

  var defaultStyleLarge = const TextStyle(fontFamily: 'Tahoma', fontSize: 14);

// Verdana is used only for title bars of tear off/floating palettes Verdana Bold, 8 point.
  var titleStyle = const TextStyle(
      fontFamily: 'Verdana', fontWeight: FontWeight.bold, fontSize: 11);

  var subtitleStyle = const TextStyle(
      fontFamily: 'Verdana', fontSize: 11, fontWeight: FontWeight.normal);

// Trebuchet MS is used only for the title bars of windows- Trebuchet MS Bold, 10 point.
  var windowTitle = const TextStyle(
      fontFamily: 'Trebuchet', fontWeight: FontWeight.bold, fontSize: 13);
}
