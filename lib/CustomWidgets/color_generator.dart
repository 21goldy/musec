import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GridTileColors {
  static const List<Color> colors = [
    Color(0xFFe4d3cd),
    Color(0xFF0097b2),
    Color(0xFFffde59),
    Color(0xFF5170ff),
    Color(0xFF7ed957),
    Color(0xFFe2a9f1),
    Color(0xFFa6a6a6),
    Color(0xFFc7ad92),
  ];

  static Color byIndex(int index) {
    return colors[index % colors.length];
  }
}
