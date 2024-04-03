import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeClip2 extends CustomPainter {
  const HomeClip2(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height + 10.h;

    /// OUTLINE BORDER
    final outlinePaint = Paint()
      ..color = const Color(0xff2D2D2D)
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.w;

    var outlinePath = layerPath(width, height, outlinePaint);
    outlinePath = outlinePath.shift(Offset(0, 22.h));
    canvas.drawPath(outlinePath, outlinePaint);

    /// FILL
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var fillPath = layerPath(width, height, fillPaint);
    fillPath = fillPath.shift(Offset(0, 22.h));
    canvas.drawPath(fillPath, fillPaint);
  }

  Path layerPath(double width, double height, Paint paint) {
    final path = Path()
      ..moveTo(0, 0)
      ..arcToPoint(Offset(35.w, -15.h), radius: const Radius.circular(20).r, clockwise: true)
      ..arcToPoint(Offset(70.w, 0), radius: const Radius.circular(45).r, clockwise: false)

      /// Top Right
      ..lineTo(width - 20.w, 0)
      ..arcToPoint(Offset(width, 20.h), radius: const Radius.circular(20).r, clockwise: true)

      ///
      ..lineTo(width, height - 20.h)
      ..arcToPoint(Offset(width - 20.w, height), radius: const Radius.circular(20).r, clockwise: true)

      /// Bottom Right
      ..lineTo(30.w, height)
      ..arcToPoint(Offset(10.w, height - 20.h), radius: const Radius.circular(20).r, clockwise: true)

      /// Bottom Left
      ..lineTo(10, 70)
      ..arcToPoint(Offset(5.w, 55.h), radius: const Radius.circular(35).r, clockwise: false)
      ..arcToPoint(Offset(0, 30.h), radius: const Radius.circular(45).r, clockwise: true)

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
