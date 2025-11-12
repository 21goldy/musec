import 'dart:math' as math;
import 'package:flutter/material.dart';

class DiagonalChexPainter extends CustomPainter {
  final Color lineColor;
  final double lineWidth;
  final double cellSize;
  final double angleDegrees;

  DiagonalChexPainter({
    required this.lineColor,
    required this.lineWidth,
    required this.cellSize,
    this.angleDegrees = 45,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;

    final angle = angleDegrees * math.pi / 180;
    final center = Offset(size.width / 2, size.height / 2);
    final diag = math.sqrt(size.width * size.width + size.height * size.height);

    void drawLineSet(double angle) {
      final dx = math.cos(angle);
      final dy = math.sin(angle);
      final px = -dy;
      final py = dx;

      for (double i = -diag; i <= diag; i += cellSize) {
        canvas.drawLine(
          center + Offset(px * i - dx * diag, py * i - dy * diag),
          center + Offset(px * i + dx * diag, py * i + dy * diag),
          paint,
        );
      }
    }

    drawLineSet(angle);
    drawLineSet(angle + math.pi / 2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
