import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeClip1 extends CustomPainter {
  const HomeClip1(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height + 10.h;

    /// OUTLINE BORDER
    final outlinePaint = Paint()
      ..color = const Color(0xff121212)
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15.w;

    var outlinePath = layerPath(width, height, outlinePaint);
    canvas.drawPath(outlinePath, outlinePaint);

    /// FILL
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var fillPath = layerPath(width - 8.w, height - 8.h, fillPaint);
    fillPath = fillPath.shift(Offset(4.w, 4.h));
    canvas.drawPath(fillPath, fillPaint);
  }

  Path layerPath(double width, double height, Paint paint) {
    final path = Path()
      ..moveTo(35.w, 0)

    /// Top Right
      ..lineTo(width - 85.w, 0)
      ..arcToPoint(Offset(width - 50.w, 30.h), radius: const Radius.circular(35).r, clockwise: true)

    /// Bottom Right
      ..lineTo(width - 20.w, height - 42.h)
      ..arcToPoint(Offset(width - 52.w, height), radius: const Radius.circular(34).r, clockwise: true)

    /// Bottom Left
      ..lineTo(35.w, height)
      ..arcToPoint(Offset(0, height - 35.h), radius: const Radius.circular(35).r, clockwise: true)

    /// Top Left
      ..lineTo(0, 35.h)
      ..arcToPoint(Offset(35.w, 0), radius: const Radius.circular(35).r, clockwise: true);
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
