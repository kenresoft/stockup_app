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
      ..color = const Color(0xff2D2D2D)
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    var outlinePath = layerPath(width, height, outlinePaint);
    outlinePath = outlinePath.shift(const Offset(0, 22));
    canvas.drawPath(outlinePath, outlinePaint);

    /// FILL
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var fillPath = layerPath(width, height, fillPaint);
    fillPath = fillPath.shift(const Offset(0, 22));
    canvas.drawPath(fillPath, fillPaint);
  }

  Path layerPath(double width, double height, Paint paint) {
    final path = Path()
      ..moveTo(0, 0)
      ..arcToPoint(Offset(35, -15), radius: const Radius.circular(20), clockwise: true)
      ..arcToPoint(Offset(70, 0), radius: const Radius.circular(45), clockwise: false)

      /// Top Right
      ..lineTo(width - 20, 0)
      ..arcToPoint(Offset(width, 20), radius: const Radius.circular(20), clockwise: true)

      ///
      ..lineTo(width, height - 20)
      ..arcToPoint(Offset(width - 20, height), radius: const Radius.circular(20), clockwise: true)

      /// Bottom Right
      ..lineTo(30, height)
      ..arcToPoint(Offset(10, height - 20), radius: const Radius.circular(20), clockwise: true)

      /// Bottom Left
      ..lineTo(10, 70)
      ..arcToPoint(Offset(5, 55), radius: const Radius.circular(35), clockwise: false)
      ..arcToPoint(Offset(0, 30), radius: const Radius.circular(45), clockwise: true)

      /// Top Left
      ..lineTo(0, 0);
    //..arcToPoint(const Offset(35, 0), radius: const Radius.circular(35), clockwise: true);
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
