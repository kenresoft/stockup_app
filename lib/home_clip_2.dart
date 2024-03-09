import 'package:flutter/material.dart';

class HomeClip2 extends CustomPainter {
  const HomeClip2(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height + 10;

    /// OUTLINE BORDER
    final outlinePaint = Paint()
      ..color = const Color(0xff121212)
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15;

    var outlinePath = layerPath(width, height, outlinePaint);
    canvas.drawPath(outlinePath, outlinePaint);

    /// FILL
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var fillPath = layerPath(width - 8, height - 8, fillPaint);
    fillPath = fillPath.shift(const Offset(4, 4));
    canvas.drawPath(fillPath, fillPaint);
  }

  Path layerPath(double width, double height, Paint paint) {
    final path = Path()
      ..moveTo(35, 0)

    /// Top Right
      ..lineTo(width - 85, 0)
      ..arcToPoint(Offset(width - 50, 30), radius: const Radius.circular(35), clockwise: true)

    /// Bottom Right
      ..lineTo(width - 20, height - 42)
      ..arcToPoint(Offset(width - 52, height), radius: const Radius.circular(34), clockwise: true)

    /// Bottom Left
      ..lineTo(35, height)
      ..arcToPoint(Offset(0, height - 35), radius: const Radius.circular(35), clockwise: true)

    /// Top Left
      ..lineTo(0, 35)
      ..arcToPoint(const Offset(35, 0), radius: const Radius.circular(35), clockwise: true);
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
