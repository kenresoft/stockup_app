import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarClip extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff292929)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = const Color(0xff202020)
      ..style = PaintingStyle.fill;

    final curvePaint = Paint()
      ..color = const Color(0xff292929)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.addOval(Rect.fromCircle(center: Offset(25.w, 30.h), radius: 28.w));
    path.addOval(Rect.fromCircle(center: Offset(70.w, 30.h), radius: 28.w));
    path.addOval(Rect.fromCircle(center: Offset(125.w, 30.h), radius: 35.w));
    path.addOval(Rect.fromCircle(center: Offset(180.w, 30.h), radius: 28.w));
    path.addOval(Rect.fromCircle(center: Offset(225.w, 30.h), radius: 28.w));

    canvas.drawPath(path, paint);

    /// 1 - 2
    canvas.drawPath(
        Path()
          ..moveTo(40.w, 13.h)
          ..quadraticBezierTo(47.5.w, 22.h, 55.w, 13.h),
        curvePaint);

    /// 2 - 3
    canvas.drawPath(
        Path()
          ..moveTo(85.w, 13.h)
          ..quadraticBezierTo(92.5.w, 22.h, 98.w, 13.h),
        curvePaint);

    /// 3 - 4
    canvas.drawPath(
        Path()
          ..moveTo(142.w, 13.h)
          ..quadraticBezierTo(147.5, 22, 155, 13),
        curvePaint);

    /// 4 - 5
    canvas.drawPath(
        Path()
          ..moveTo(185.w, 13.h)
          ..quadraticBezierTo(192.5.w, 22.h, 200.w, 13.h),
        curvePaint);

    canvas.drawPath(path.shift( Offset(0, 2.h)), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
