import 'dart:math';
import 'package:flutter/material.dart';

class PastelColor {
  static final Random _random = Random();

  static Color generate() {
    final double hue = _random.nextDouble() * 360;
    final double saturation = 0.50 + _random.nextDouble() * 0.20;
    final double lightness = 0.58 + _random.nextDouble() * 0.12;

    return HSLColor.fromAHSL(
      1.0,
      hue,
      saturation,
      lightness,
    ).toColor();
  }

  static Color fromSeed(String seed) {
    final int hash = seed.codeUnits.fold(0, (a, b) => a + b);
    final double hue = (hash % 360).toDouble();

    return HSLColor.fromAHSL(
      1.0,
      hue,
      0.60,
      0.63,
    ).toColor();
  }
}
