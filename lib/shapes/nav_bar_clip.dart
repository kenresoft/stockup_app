import 'package:flutter/material.dart';

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

    path.addOval(Rect.fromCircle(center: const Offset(25, 30), radius: 28));
    path.addOval(Rect.fromCircle(center: const Offset(70, 30), radius: 28));
    path.addOval(Rect.fromCircle(center: const Offset(125, 30), radius: 35));
    path.addOval(Rect.fromCircle(center: const Offset(180, 30), radius: 28));
    path.addOval(Rect.fromCircle(center: const Offset(225, 30), radius: 28));

    canvas.drawPath(path, paint);

    /// 1 - 2
    canvas.drawPath(
        Path()
          ..moveTo(40, 13)
          ..quadraticBezierTo(47.5, 22, 55, 13),
        curvePaint);

    /// 2 - 3
    canvas.drawPath(
        Path()
          ..moveTo(85, 13)
          ..quadraticBezierTo(92.5, 22, 98, 13),
        curvePaint);

    /// 3 - 4
    canvas.drawPath(
        Path()
          ..moveTo(142, 13)
          ..quadraticBezierTo(147.5, 22, 155, 13),
        curvePaint);

    /// 4 - 5
    canvas.drawPath(
        Path()
          ..moveTo(185, 13)
          ..quadraticBezierTo(192.5, 22, 200, 13),
        curvePaint);

    canvas.drawPath(path.shift(const Offset(0, 2)), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
